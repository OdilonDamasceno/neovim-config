local g = vim.g
local autocmd = require("modules.utils").autocmd

g.dashboard_default_executive = "telescope"
g.dashboard_disable_statusline = 1

g.dashboard_custom_header = {
    "															 ", "															 ", "															 ",
    "															 ", "															 ", "															 ",
    "██████╗ ██╗███╗   ██╗ ██████╗ ",
    "██╔══██╗██║████╗  ██║██╔═══██╗",
    "██║  ██║██║██╔██╗ ██║██║   ██║",
    "██║  ██║██║██║╚██╗██║██║   ██║",
    "██████╔╝██║██║ ╚████║╚██████╔╝",
    "╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ",
    "															 "
}

g.dashboard_custom_section = {
    a = {
        description = {"洛 New File                  SPC f n"},
        command = "DashboardNewFile"
    },
    b = {
        description = {"  Recents                   SPC f o"},
        command = "Telescope oldfiles"
    },
    c = {
        description = {"  Find File                 SPC f f"},
        command = "Telescope find_files"
    },
    d = {
        description = {"  Find Word                 SPC f w"},
        command = "Telescope live_grep"
    },
    e = {
        description = {"  Bookmarks                 SPC b m"},
        command = "Telescope marks"
    },
    f = {
        description = {"  Load Last Session         SPC s l"},
        command = "SessionLoad"
    },
    g = {
        description = {"  Org Agenda                SPC s o"},
        command = function() require('orgmode').action('agenda.prompt') end
    }
}

g.indentLine_fileTypeExclude = {'dashboard', "terminal"}

autocmd "FileType dashboard set showtabline=0"
autocmd "WinLeave <buffer> set showtabline=2"

g.dashboard_custom_footer = {"   ", "Dino"}
