local M = {}

M.cmd = vim.cmd

M.set = function(value) M.cmd("set " .. value) end

M.autocmd = function(value) M.cmd("autocmd " .. value) end

M.bg = function(class, color) M.cmd("hi " .. class .. " guibg=" .. color) end

M.fg = function(class, color) M.cmd("hi " .. class .. " guifg=" .. color) end

M.setBackgroundColor = function(color)
    local command = [[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=]] .. color .. [[ 
    augroup END
    ]]
    vim.api.nvim_command(command)
end

M.colorscheme = function(value) M.cmd("colorscheme " .. value) end

return M
