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

config.global = {tokyonight_style = "night", tokyonight_italic_functions = true}

config.options = {}

return config
