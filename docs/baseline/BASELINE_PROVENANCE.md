# Baseline Provenance

This project builds on the starter repository provided for the LLM-assisted Isabelle/HOL theorem proving task.

The original starter README is preserved in:

- `docs/baseline/README_original.md`

The top-level `README.md` has been rewritten for a public, reproducible research artifact. It describes the final system, installation steps, supported LLM backends, benchmark commands, results structure, and security notes.

Major changes made in this project include:

- Windows and Isabelle2025 compatibility fixes.
- Isabelle client response parsing fixes.
- Windows-to-Isabelle path conversion.
- LiteLLM multi-provider routing for Ollama, OpenAI, and Gemini models.
- Benchmark result organisation and evidence indexing.
- Planner strict no-sorry verification and de-sorry repair cleanup.
- Reproducibility and security documentation.

This folder is included to preserve the baseline context while keeping the public-facing project documentation focused on the final improved system.
