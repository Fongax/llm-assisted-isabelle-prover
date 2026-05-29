cd $PSScriptRoot\..
.\.venv\Scripts\activate

$env:ISABELLE_INST_DIR = "C:\Path\To\Isabelle2025-2"
$env:Path += ";C:\Path\To\Isabelle2025-2\bin"
$env:LLM_DEBUG = "0"

python -m planner.experiments bench --file datasets\planner_tiny_ascii.txt --mode auto --timeout 120 --diverse --k 2 --temps "0.35,0.55" --strict-no-sorry --verify --model qwen2.5-coder:7b --shuffle --seed 42 --trace
python -m planner.experiments aggregate --dir datasets\planner_results --min-rows 1
