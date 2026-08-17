---
layout: single
title: "TensorFlow Quick Start"
permalink: /quick-start-tensorflow/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

This page shows a minimal TensorFlow workflow in the E4S 26.06 CUDA container. The examples here are intended to be run inside the Docker image shown below.

```bash
docker run --gpus all -it --rm \
  --entrypoint bash \
  -v "$PWD:/work" \
  -w /work \
  ecpe4s/e4s-cuda:26.06
```

## 1. Verify TensorFlow and GPU visibility

Inside the container:

```bash
python3 - <<'PY'
import tensorflow as tf
print('TensorFlow version:', tf.__version__)
print('GPUs visible:', tf.config.list_physical_devices('GPU'))
PY
```

Expected result: one or more GPU devices are visible.

## 2. Run a small linear regression example

Create a small script:

```bash
cat > tensorflow_demo.py <<'PY'
import tensorflow as tf
import numpy as np

print('TensorFlow version:', tf.__version__)
print('GPUs visible:', tf.config.list_physical_devices('GPU'))

np.random.seed(0)
X = np.linspace(-1, 1, 200).astype('float32').reshape(-1, 1)
Y = 3 * X + 2 + 0.1 * np.random.randn(*X.shape).astype('float32')

model = tf.keras.Sequential([tf.keras.layers.Dense(1, input_shape=(1,))])
model.compile(optimizer=tf.keras.optimizers.SGD(learning_rate=0.1), loss='mse')
history = model.fit(X, Y, epochs=50, verbose=0)

w, b = model.layers[0].get_weights()
print(f'Learned: y = {w[0][0]:.3f}x + {b[0]:.3f}  (target: y = 3x + 2), loss={history.history["loss"][-1]:.4f}')
PY
```

Run it with a pinned GPU:

```bash
python3 tensorflow_demo.py
```

This trains a simple model and prints the learned slope and intercept.

## 3. Typical next steps

After the container is running, you can:

- use `tf.keras` for model development,
- fit models on the pinned GPU,
- and adapt the same workflow to your own data or scripts.

As with other E4S containers, the main operational difference from a normal host environment is that GPU access and the mounted working directory are managed by the container runtime.

For additional container guidance, see [E4S Container Installation](/container-installation/) and [E4S Container Launch](/container-launch/).
