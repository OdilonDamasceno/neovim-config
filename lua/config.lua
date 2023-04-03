local M = {}
local def = {}
local HOME = os.getenv("HOME")

local userConfigPath = HOME .. "/.dino.d/init.lua"

M = dofile(userConfigPath)

def.config = require("def_config")

def.packages = {}

return vim.tbl_deep_extend("keep", M, def)
