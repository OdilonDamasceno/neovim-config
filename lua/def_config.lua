local config = {}

config.theme = "tokyonight"

config.agenda = {
    agenda_files = {'~/Agenda/*'},
    notes_file = '~/Agenda/notes.org'
}

config.airline_theme = "zenburn"

-- Set the background color for vim
-- By default use the color of theme
-- config.backgroundColor = "#FFFFFF"

config.global = {
    tokyonight_style = "storm",
    tokyonight_italic_functions = true,
    tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
}

config.options = {}

config.mapping = {
    {
        mode = "",
        bidding = "<C-b>",
        command = ":CHADopen<CR>",
        options = {}
    }, {
        mode = "",
        bidding = "<M-Up>",
        command = ":move -2<CR>",
        options = {}
    }, {
        mode = "",
        bidding = "<M-Down>",
        command = ":move +1<CR>",
        options = {}
    },
		{
				mode = 'i',
				bidding = "<C-Space>",
				command = "<Cmd>call coc#refresh()<CR>",
				options = { silent = true}
		},
		{
				mode = "i",
				bidding = "<C-S-p>",
				command = ":execute .. 13 'new term://'<CR>",
				options = {}
		},
}

return config
