vim.cmd [[packadd packer.nvim]]

require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'

        use 'vim-airline/vim-airline'

        use 'vim-airline/vim-airline-themes'

        use "glepnir/dashboard-nvim"

        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/plenary.nvim'}}
        }

        use {
            'kristijanhusak/orgmode.nvim',
            config = function()
                require('orgmode').setup({
                    org_agenda_files = require('config').config.agenda.agenda_files,
                    org_default_notes_file = require('config').config.agenda
                        .notes_file
                })
            end
        }

        use {'neoclide/coc.nvim', branch = 'release'}

        use {
            'akinsho/bufferline.nvim',
            requires = 'kyazdani42/nvim-web-devicons'
        }

        use 'folke/tokyonight.nvim'

        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

        use {
            "windwp/nvim-autopairs",
            config = function() require('nvim-autopairs').setup {} end
        }

        local config = require("config")

        for _, value in pairs(config.packages) do pcall(use, value) end

    end,
    config = {display = {open_fn = require('packer.util').float}}
})
