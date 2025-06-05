local status_ok, gemini = pcall(require, "gemini")
if not status_ok then
  return
end
gemini.setup({})
