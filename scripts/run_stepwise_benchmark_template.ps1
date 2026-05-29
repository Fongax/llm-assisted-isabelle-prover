cd $PSScriptRoot\..
.\.venv\Scripts\activate

$env:ISABELLE_INST_DIR = "C:\Path\To\Isabelle2025-2"
$env:Path += ";C:\Path\To\Isabelle2025-2\bin"
$env:LLM_DEBUG = "0"

$model = "litellm:ollama/qwen2.5-coder:7b"
$file = "datasets\lists.txt"

python -m prover.experiments bench --file $file --beam 3 --max-depth 6 --timeout 90 --reranker both --model $model --shuffle --seed 42
python -m prover.experiments bench --file $file --beam 3 --max-depth 6 --timeout 90 --reranker both --sledge --quickcheck --nitpick --model $model --shuffle --seed 42
python -m prover.experiments aggregate --dir datasets\results --min-rows 1
