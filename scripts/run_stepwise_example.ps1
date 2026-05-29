cd $PSScriptRoot\..
.\.venv\Scripts\activate

$env:ISABELLE_INST_DIR = "C:\Path\To\Isabelle2025-2"
$env:Path += ";C:\Path\To\Isabelle2025-2\bin"
$env:LLM_DEBUG = "0"

python -m prover.cli --goal "xs @ [] = xs" --model litellm:ollama/qwen2.5-coder:7b --beam 3 --max-depth 5 --timeout 90 --trace
