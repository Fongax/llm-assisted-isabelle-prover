# LLM-Assisted Isabelle/HOL Prover

A reproducible research artifact for verifier-guided LLM-assisted theorem proving in Isabelle/HOL. The system uses language models to propose proof tactics and proof fragments, while Isabelle/HOL remains the trusted verifier for accepted proofs.

This project builds on a provided starter repository for LLM-assisted Isabelle/HOL theorem proving. The original starter README is preserved in `docs/baseline/README_original.md`, with provenance notes in `docs/baseline/BASELINE_PROVENANCE.md`.

## Features

- Stepwise Isabelle/HOL proof search with beam search.
- Optional Sledgehammer, Quickcheck, and Nitpick integration.
- LiteLLM-based model routing for local and hosted LLMs.
- Local Ollama models such as Qwen2.5-Coder and Qwen3-Coder.
- Hosted OpenAI and Gemini model support through environment variables.
- Planner Fill/Repair workflow with strict no-`sorry` verification.
- Organised benchmark evidence and raw result CSV files for reproducibility.

## Repository Structure

```text
prover/                 Stepwise prover, Isabelle API integration, LLM routing
planner/                Isar outline generation, Fill/Repair, strict de-sorry cleanup
baselines/              Baseline comparison scripts
isabelle_ui/            Isabelle/jEdit integration helpers
datasets/               Controlled, HOL, miniF2F, and Putnam-style datasets
results/                Benchmark evidence, raw CSVs, and summary indexes
scripts/                Example PowerShell commands for running experiments
requirements.txt        Python dependencies
REPRODUCIBILITY.md      Setup and rerun instructions
RESULTS.md              Summary of included benchmark results
SECURITY.md             API-key handling and secret-checking notes
CITATION.cff            Citation metadata for the artifact
```

## Installation

Create and activate a Python virtual environment, then install dependencies:

```powershell
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
```

Install Isabelle and set the environment variable used by the scripts:

```powershell
$env:ISABELLE_INST_DIR = "C:\Users\<you>\Desktop\Isabelle2025-2"
$env:Path += ";$env:ISABELLE_INST_DIR\bin"
```

For local models, install Ollama and pull a model, for example:

```powershell
ollama pull qwen2.5-coder:7b
```

For hosted models, set API keys in your shell. Do not commit them to the repository.

```powershell
$env:OPENAI_API_KEY = "<your-openai-key>"
$env:GEMINI_API_KEY = "<your-gemini-key>"
```

## Quick Start

Run a single proof attempt:

```powershell
python -m prover.cli --goal "xs @ [] = xs" --model litellm:ollama/qwen2.5-coder:7b --beam 3 --max-depth 5 --timeout 90 --trace
```

Run a small benchmark:

```powershell
python -m prover.experiments bench --file datasets\logic.txt --beam 3 --max-depth 5 --timeout 60 --reranker both --model litellm:ollama/qwen2.5-coder:7b --shuffle --seed 42
```

Aggregate benchmark results:

```powershell
python -m prover.experiments aggregate --dir datasets\results --min-rows 1
```

Run the planner benchmark:

```powershell
python -m planner.experiments bench --file datasets\planner_tiny_ascii.txt --mode auto --timeout 120 --diverse --k 2 --temps "0.35,0.55" --strict-no-sorry --verify --model qwen2.5-coder:7b --shuffle --seed 42 --trace
```

## Results

The `results/` directory is organised for reproducibility:

- `results/benchmark_evidence/`: selected benchmark CSVs used for headline result comparisons.
- `results/raw/`: raw prover and planner CSV outputs.
- `results/summaries/`: index files that map result claims to raw evidence.

See [`RESULTS.md`](RESULTS.md) for a summary and [`REPRODUCIBILITY.md`](REPRODUCIBILITY.md) for rerun instructions.

## Security

No API keys are included. Use environment variables or a local untracked `.env` file. Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check_no_secrets.ps1
```

before publishing changes.

## Citation

If you use this artifact, see [`CITATION.cff`](CITATION.cff).
