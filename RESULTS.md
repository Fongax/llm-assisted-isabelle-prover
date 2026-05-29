# Results Overview

This repository contains benchmark evidence for a verifier-guided LLM-assisted Isabelle/HOL prover. The benchmark data is organised to make it possible to trace headline comparisons back to raw CSV files.

## Directory Layout

```text
results/benchmark_evidence/   Selected CSV files for main result comparisons
results/raw/                  Raw prover and planner benchmark outputs
results/summaries/            Index files mapping claims to evidence
```

Useful index files:

- `results/summaries/benchmark_evidence_index.csv`
- `results/summaries/all_prover_runs_index.csv`
- `results/summaries/planner_runs_index.csv`
- `results/summaries/selected_benchmark_evidence_files.csv`

## Main Comparisons

The included evidence supports comparisons across:

- LLM backends: Qwen/Ollama, OpenAI, and Gemini routes.
- Proof-search tools: Sledgehammer off versus Sledgehammer on.
- Candidate ordering: reranker off versus reranker on.
- Difficulty levels: small controlled datasets and HOL easy/mid/hard datasets.
- Planner repair: before and after strict no-`sorry` cleanup.

## Verification Policy

A proof is counted as successful only when Isabelle/HOL verifies the resulting proof. Planner outputs are additionally required to contain no `sorry`.
