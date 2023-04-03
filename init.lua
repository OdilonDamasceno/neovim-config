local modules = {"config", "plugins", "modules", "setup"}

for _, value in ipairs(modules) do pcall(require, value) end
