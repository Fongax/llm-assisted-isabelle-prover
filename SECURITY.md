# Security Notes

Do not commit API keys or private `.env` files. Use environment variables instead:

```powershell
$env:OPENAI_API_KEY = "<your-openai-key>"
$env:GEMINI_API_KEY = "<your-gemini-key>"
```
