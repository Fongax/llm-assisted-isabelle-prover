# Searches the repository for common API-key patterns.
# Placeholder variable names such as OPENAI_API_KEY are expected and safe.
Get-ChildItem -Recurse -File |
  Where-Object { $_.FullName -notmatch "\\.git\\" } |
  Select-String -Pattern "sk-proj", "AIza"
