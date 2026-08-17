---
layout: single
title: "NeMo Quick Start"
permalink: /quick-start-nemo/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

This page shows a NeMo workflow in the E4S 26.06 CUDA container. The examples here are intended to be run inside the Docker image shown below.

```bash
docker run --gpus all -it --rm \
  --entrypoint bash \
  -v "$PWD:/work" \
  -w /work \
  ecpe4s/e4s-cuda:26.06
```

## 1. Verify the NeMo packages

The container includes the NeMo packages used by this workflow: `megatron.core`, `megatron.bridge`, and `nemo_run`.

A quick import check:

```bash
python3 - <<'PY'
import megatron.core
import megatron.bridge
import nemo_run
print('megatron.core import OK')
print('megatron.bridge import OK')
print('nemo_run import OK:', getattr(nemo_run, '__version__', 'OK'))
PY
```

This confirms the NeMo stack is available for use inside the container.

## 2. Minimal Megatron-Bridge smoke test

The core pattern in this workflow is converting a Hugging Face model to Megatron's native format through `AutoBridge`.

Create a script:

```bash
cat > megatron_bridge_demo.py <<'PY'
import torch
from megatron.bridge import AutoBridge

print('Loading a small HF model and converting it to Megatron format...')
bridge = AutoBridge.from_hf_pretrained('Qwen/Qwen3-0.6B')
model_provider = bridge.to_megatron_provider(load_weights=True)

print('Bridge + Megatron provider constructed successfully.')
print(type(model_provider))
PY
```

Run it with the GPU selected:

```bash
python3 megatron_bridge_demo.py
```

This loads a small model and demonstrates the bridge and model-conversion workflow.

## 3. Run a local NeMo-Run experiment

Create a small task and launch it locally with `nemo_run`:

```bash
cat > nemo_run_demo.py <<'PY'
import nemo_run as run

task = run.Script(
  inline="echo 'NeMo-Run experiment completed successfully.'"
)

with run.Experiment('e4s-quick-start') as experiment:
  experiment.add(task, executor=run.LocalExecutor(), name='hello')
  experiment.run(detach=False)
PY
python3 nemo_run_demo.py
```

The command should print `NeMo-Run experiment completed successfully.`.

## 4. Typical next steps

After the container is running, you can:

- test model conversion and bridge workflows,
- use `nemo_run` to launch experiments,
- and adapt the same pattern to your own training or evaluation scripts.

For additional container guidance, see [E4S Container Installation](/container-installation/) and [E4S Container Launch](/container-launch/).
