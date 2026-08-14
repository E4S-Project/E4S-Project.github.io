---
layout: single
title: "vLLM Quick Start"
permalink: /quick-start-vllm/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

This page shows a minimal vLLM workflow in the E4S 26.06 CUDA container. The examples here are intended to be run inside the Docker image shown below.

```bash
docker run --gpus all -it --rm \
  --entrypoint bash \
  -v "$PWD:/work" \
  -w /work \
  ecpe4s/e4s-cuda:26.06
```

## 1. Verify the vLLM install

Inside the container:

```bash
python3 - <<'PY'
import vllm
print('vLLM version:', vllm.__version__)
PY
```

This confirms that the package is present and importable.

## 2. Run a small inference example

Create a script:

```bash
cat > vllm_demo.py <<'PY'
from vllm import LLM, SamplingParams

def main():
  prompts = ['The capital of France is', 'PyTorch is a framework for']
  sampling_params = SamplingParams(temperature=0.7, max_tokens=30)

  llm = LLM(model='facebook/opt-125m')
  outputs = llm.generate(prompts, sampling_params)
  for out in outputs:
    print(out.prompt, '->', out.outputs[0].text)


if __name__ == '__main__':
  main()
PY
```

Run it with the GPU selected. Setting `CUDA_DEVICE_ORDER` keeps CUDA's device numbering consistent when the host has different GPU models:

```bash
export CUDA_DEVICE_ORDER=PCI_BUS_ID
python3 vllm_demo.py
```

This launches a small language model and prints generated text from each prompt.

## 3. Start the OpenAI-compatible server

You can also launch an OpenAI-compatible API server:

```bash
export CUDA_DEVICE_ORDER=PCI_BUS_ID
vllm serve facebook/opt-125m --port 8000
```

In another shell or another container on the same host:

```bash
curl http://localhost:8000/v1/completions \
  -H 'Content-Type: application/json' \
  -d '{"model": "facebook/opt-125m", "prompt": "Hello,", "max_tokens": 20}'
```

## 4. Typical next steps

After the container is running, you can:

- swap in a different model for inference,
- use the OpenAI-like API for serving,
- and adapt the same container workflow to a GPU-specific or batch job environment.

For additional container guidance, see [E4S Container Installation](/container-installation/) and [E4S Container Launch](/container-launch/).
