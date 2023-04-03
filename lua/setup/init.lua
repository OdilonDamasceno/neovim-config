local config = require("config").config
require('orgmode').setup_ts_grammar()
local g = vim.g
local o = vim.opt

o.splitbelow = true
o.mouse = 'a'
o.number = true
o.encoding = "UTF-8"
o.tabstop = 2
o.shiftwidth = 2

vim.g.indent_blankline_filetype_exclude = {
    "help", "terminal", "dashboard", "packer"
}

if config.backgroundColor ~= nil then
    require("modules.utils").setBackgroundColor(config.backgroundColor)
end

vim.api.nvim_command([[
autocmd FileType dashboard set mouse=
]])

vim.api.nvim_command([[
autocmd FileType CHADTree set laststatus=0
]])

require('nvim-treesitter.configs').setup {
    highlight = {enable = true, custom_captures = {}}
}

require("bufferline").setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center"
            },
            {
                filetype = "CHADTree",
                text = "File Explorer",
                text_align = "center"
            },

        }
    }
}

require("telescope").setup{
		defaults = {
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "absolute" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   },
   extensions = {
      fzf = {
         fuzzy = true, -- false will only do exact matching
         override_generic_sorter = false, -- override the generic sorter
         override_file_sorter = true, -- override the file sorter
         case_mode = "smart_case", -- or "ignore_case" or "respect_case"
         -- the default case_mode is "smart_case"
      },
      media_files = {
         filetypes = { "png", "webp", "jpg", "jpeg" },
         find_cmd = "rg", -- find command (defaults to `fd`)
      },
   },
}

for key, value in pairs(config.global) do g[key] = value end

for key, value in pairs(config.options) do o[key] = value end

for _, value in pairs(config.mapping) do
    vim.api.nvim_set_keymap(value.mode, value.bidding, value.command, value.options)
end

for _, value in pairs(config.settings) do require(value.module).setup{ value.options } end

