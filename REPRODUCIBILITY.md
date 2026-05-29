# Reproducibility

This document describes how to rerun representative experiments.

## Environment

- Windows PowerShell or equivalent shell.
- Python virtual environment with `requirements.txt` installed.
- Isabelle installed locally.
- Ollama for local models.
- Optional OpenAI/Gemini API keys for hosted models.

## Setup

```powershell
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
$env:ISABELLE_INST_DIR = "C:\Users\<you>\Desktop\Isabelle2025-2"
$env:Path += ";$env:ISABELLE_INST_DIR\bin"
```

For hosted models:

```powershell
$env:OPENAI_API_KEY = "<your-openai-key>"
$env:GEMINI_API_KEY = "<your-gemini-key>"
```

## Single-Goal Example

```powershell
python -m prover.cli --goal "xs @ [] = xs" --model litellm:ollama/qwen2.5-coder:7b --beam 3 --max-depth 5 --timeout 90 --trace
```

## Stepwise Benchmark Example

```powershell
python -m prover.experiments bench --file datasets\logic.txt --beam 3 --max-depth 5 --timeout 60 --reranker both --model litellm:ollama/qwen2.5-coder:7b --shuffle --seed 42
```

With Sledgehammer, Quickcheck, and Nitpick:

```powershell
python -m prover.experiments bench --file datasets\logic.txt --beam 3 --max-depth 5 --timeout 60 --reranker both --sledge --quickcheck --nitpick --model litellm:ollama/qwen2.5-coder:7b --shuffle --seed 42
```

Aggregate:

```powershell
python -m prover.experiments aggregate --dir datasets\results --min-rows 1
```

## Planner Benchmark Example

```powershell
python -m planner.experiments bench --file datasets\planner_tiny_ascii.txt --mode auto --timeout 120 --diverse --k 2 --temps "0.35,0.55" --strict-no-sorry --verify --model qwen2.5-coder:7b --shuffle --seed 42 --trace
```

Aggregate:

```powershell
python -m planner.experiments aggregate --dir datasets\planner_results --min-rows 1
```
