local config = require("config").config;
local colorscheme = require("modules.utils").colorscheme
local g = vim.g
local o = vim.o

o.termguicolors = true

g.airline_theme = config.airline_theme
g.airline_powerline_fonts = 1

colorscheme(config.theme)
