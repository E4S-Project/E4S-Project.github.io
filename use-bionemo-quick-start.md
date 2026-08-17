---
layout: single
title: "BioNeMo Quick Start"
permalink: /quick-start-bionemo/
classes: wide
sidebar:
  nav: "usemenu"
---

{% include e4s-page-actions.html %}

This page shows a BioNeMo workflow in the E4S 26.06 CUDA container. The examples here are intended to be run inside the Docker image shown below.

```bash
docker run --gpus all -it --rm \
  --entrypoint bash \
  -v "$PWD:/work" \
  -w /work \
  ecpe4s/e4s-cuda:26.06
```

## 1. Verify BioNeMo

The E4S container includes `bionemo-core` and related BioNeMo packages.

```bash
python3 - <<'PY'
import bionemo.core
import bionemo.moco
import bionemo.noodles
import bionemo.scdl

print('bionemo.core OK:', bionemo.core.__file__)
print('BioNeMo package imports OK')
PY
```

## 2. Run an ESM-2 inference example

This example loads an ESM-2 checkpoint and computes a sequence embedding with the container's GPU-enabled deep-learning stack.

Create a script:

```bash
cat > bionemo_esm2_recipe_demo.py <<'PY'
from transformers import AutoModel, AutoTokenizer
import torch

device = 'cuda' if torch.cuda.is_available() else 'cpu'
model = AutoModel.from_pretrained(
  'nvidia/esm2_t6_8M_UR50D',
  trust_remote_code=True,
).to(device)
tokenizer = AutoTokenizer.from_pretrained(
  'nvidia/esm2_t6_8M_UR50D',
  trust_remote_code=True,
)

sequence = 'MSKGEELFTGVVPILVELDGDVNGHKFSVSGEGEGDATYGKLTLKFICTTGKLPVPWPTL'
inputs = tokenizer(sequence, return_tensors='pt').to(device)
with torch.no_grad():
    output = model(**inputs)

print('Output embedding shape:', output.last_hidden_state.shape)
PY
```

Run the example:

```bash
python3 bionemo_esm2_recipe_demo.py
```

The first run downloads the checkpoint and may print model-loading details. The `UNEXPECTED` entries for `lm_head` weights can be ignored for this embedding model. A successful run ends with output similar to:

```text
Output embedding shape: torch.Size([1, 62, 320])
```

The exact sequence length can vary with the input sequence; the final dimension is the model's embedding size.

## 3. Typical next steps

After the container is running, you can adapt the example to your own protein sequences and use a mounted working directory for scripts and outputs.

For additional container guidance, see [E4S Container Installation](/container-installation/) and [E4S Container Launch](/container-launch/).