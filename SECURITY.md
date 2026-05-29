# Security Notes

Do not commit API keys or private `.env` files. Use environment variables instead:

```powershell
$env:OPENAI_API_KEY = "<your-openai-key>"
$env:GEMINI_API_KEY = "<your-gemini-key>"
```

Before publishing, run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check_no_secrets.ps1
```

The secret check searches for common key prefixes such as `sk-proj` and `AIza`. Placeholder variable names such as `OPENAI_API_KEY` are expected and safe.
