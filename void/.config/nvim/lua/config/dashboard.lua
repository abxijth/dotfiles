local db = require("dashboard")

db.setup({
    theme = "doom",
    config = {
        header = {
            "",
            "",
            [[  __  __  ____   _____   __  __   ______               ]],
            [[ /\ \/\ \/\  _`\/\  __`\/\ \/\ \ /\__  _\   /'\_/`\     ]],
            [[ \ \ `\\ \ \ \L\_\ \ \/\ \ \ \ \ \/_/\ \/  /\   \    ]],
            [[  \ \ , ` \ \  _\L\ \ \ \ \ \ \ \ \ \ \ \  \ \ \__\ \   ]],
            [[   \ \ \`\ \ \ \L\ \ \ \_\ \ \ \_/ \ \_\ \__\ \ \_/\ \  ]],
            [[    \ \_\ \_\ \____/\ \_____\ `\___/ /\_____\\ \_\\ \_\ ]],
            [[     \/_/\/_/\/___/  \/_____/`\/__/  \/_____/ \/_/ \/_/ ]],
            "",
            "",
        },
        center = {
            {
                icon = "|>  ",
                desc = "Open config          ",
                action = "lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim/' })",
                key = "c",
            },
            {
                icon = "󰈞  ",
                desc = "Find File          ",
                action = "Telescope find_files",
                key = "f",
            },
            {
                icon = "󰊄  ",
                desc = "Recent Files       ",
                action = "Telescope oldfiles",
                key = "r",
            },
            {
                icon = "󰱼  ",
                desc = "Find Text          ",
                action = "Telescope live_grep",
                key = "g",
            },
            {
                icon = "󱉟  ",
                desc = "Harpoon Quick Menu ",
                action = 'lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())',
                key = "h",
            },
            {
                icon = "󰏖  ",
                desc = "Quit Neovim        ",
                action = "qa",
                key = "q",
            },
        },
        footer = { "", "⚡ Neovim, btw." },
    },
})
