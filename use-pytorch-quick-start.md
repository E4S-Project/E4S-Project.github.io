---
layout: single
title: "PyTorch Quick Start"
permalink: /quick-start-pytorch/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

This page shows a minimal PyTorch workflow in the E4S 26.06 CUDA container. The examples here are intended to be run inside the Docker image shown below.

```bash
docker run --gpus all -it --rm \
  --entrypoint bash \
  -v "$PWD:/work" \
  -w /work \
  ecpe4s/e4s-cuda:26.06
```

## 1. Verify that PyTorch sees CUDA

Inside the container:

```bash
python3 - <<'PY'
import torch
print('PyTorch version:', torch.__version__)
print('CUDA available:', torch.cuda.is_available())
if torch.cuda.is_available():
    print('Device:', torch.cuda.get_device_name(0))
PY
```

Expected result: `CUDA available: True` and a GPU name such as `NVIDIA A100 ...`.

## 2. Run a small training example

Create a small file:

```bash
cat > pytorch_demo.py <<'PY'
import torch
import torch.nn as nn

print('PyTorch version:', torch.__version__)
print('CUDA available:', torch.cuda.is_available())
if torch.cuda.is_available():
    print('Device:', torch.cuda.get_device_name(0))

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

x = torch.randn(4, 4, requires_grad=True, device=device)
y = (x ** 2).sum()
y.backward()
print('Gradient check OK:', torch.allclose(x.grad, 2 * x.detach()))

torch.manual_seed(0)
X = torch.linspace(-1, 1, 200, device=device).unsqueeze(1)
Y = 3 * X + 2 + 0.1 * torch.randn_like(X)
model = nn.Linear(1, 1).to(device)
opt = torch.optim.SGD(model.parameters(), lr=0.1)
loss_fn = nn.MSELoss()

for _ in range(200):
    opt.zero_grad()
    loss = loss_fn(model(X), Y)
    loss.backward()
    opt.step()

w, b = model.weight.item(), model.bias.item()
print(f'Learned: y = {w:.3f}x + {b:.3f}  (target: y = 3x + 2), loss={loss.item():.4f}')
PY
```

Run it with the GPU selected:

```bash
python3 pytorch_demo.py
```

You should see the model learn a line close to `y = 3x + 2`.

## 3. Typical next steps

Once the container is running, you can:

- import `torch`, `torchvision`, or `torchaudio` directly,
- create your own model files in the mounted working directory,
- and run the same workflow on a different node or a different E4S image variant.

For short, reproducible demos, a mounted host directory is the simplest way to keep your scripts and outputs outside the container.

For additional container guidance, see [E4S Container Installation](/container-installation/) and [E4S Container Launch](/container-launch/).
