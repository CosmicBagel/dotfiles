-- -- -- basic vim options -- -- --
vim.opt.shortmess:append({ I = true }) -- disable the startup message
vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"

-- The + register (system clipboard register) behaves the same as
-- unnamed register (yank/put/delete will go to system clipboard)
vim.opt.clipboard = "unnamedplus"

vim.opt.mousescroll = "ver:1,hor:1"
-- may want to limit scroll adjustment to macbook
-- if vim.fn.has("macunix") == 1 then
-- end

-- force OSC 52 when ssh'd in (this lets copy paste to work in nvim over ssh)
if os.getenv("SSH_TTY") ~= nil then
    local function regular_paste(_)
        return function(_)
            local content = vim.fn.getreg('"')
            return vim.split(content, "\n")
        end
    end
    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        -- paste doesn't work with wezterm :`(
        paste = {
            ["+"] = regular_paste("+"),
            ["*"] = regular_paste("*"),
        },
    }
end

-- disable netrw (for nvim-tree compatability)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.jumpoptions = "stack,view"

vim.opt.termguicolors = true -- enable proper colors
vim.opt.autowriteall = false -- kind of like auto-save, but I only want it in certain situations

vim.opt.swapfile = false -- I find the swap file thing to be annoying
-- how often swapfile is written to disk when no keys are pressed
-- swapfile is disabled, but apparently some plugins look at this value to
-- decide how frequently to update
vim.opt.updatetime = 50
vim.opt.undofile = true -- preserve undo state, needed for undotree

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.opt.relativenumber = true -- show line numbers
vim.opt.number = true -- show line numbers
vim.cmd("set linebreak") -- don't spilt words when line wrapping
vim.opt.wrap = false
-- vim.opt.colorcolumn = "80"  -- displays guideline at 80 characters

-- when backspacing, delete indents, end of lines, and starts(?)
-- vim.opt.backspace = "indent,eol,start" -- this is default

-- keep 0 lines on screen above and below cursor
vim.opt.scrolloff = 2

-- sensible tab behaviour
vim.opt.expandtab = true -- replace tabs with spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true -- preserve indentation when a line is wrapped

-- show the gutter
vim.opt.signcolumn = "yes"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- show offscreen substitions (:s :%s) in a preview pane
vim.opt.inccommand = "split"

-- display undesireable characters (trailing space, tabs not converted to
-- spaces, and weird non-breaking spaces)
vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { tab = "-->", lead = "·", trail = "·", nbsp = "␣", extends = "󰧂", precedes = "󰧀", eol = "" }
vim.opt.listchars = { tab = "-->", trail = "·", nbsp = "␣", extends = "󰧂", precedes = "󰧀", eol = "" }

-- highlight line cursor is currently on
vim.opt.cursorline = true

-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"
-- highlight groups are specified here, but colors for the highlight groups are set in color_scheme.lua
vim.opt.guicursor = "n-c-sm:Cursor,v:VisualCursor,i-ci-ve:InsertCursor,r-cr:ReplaceCursor,o:OperatorPendingCursor,t:TermCursor"

-- Once a proper status line is installed, might want to remove this
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- sensible search
vim.opt.ignorecase = true vim.opt.smartcase = true

-- sensible spelling
-- vim.opt.spell = false <- set by autocommand for specific file types (eg terminal)
vim.opt.spell = false
vim.opt.spelllang = { "en_ca" }
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- hide command line
-- vim.opt.cmdheight = 0

-- recommended for autosessions
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- use pwsh and powershell as fallback on windows
if vim.fn.has("win32") == 1 then
    if vim.fn.executable("pwsh.exe") == 1 then
        vim.o.shell = "pwsh.exe -NoLogo"
    else
        vim.o.shell = "powershell.exe -NoLogo"
    end
    vim.o.shellcmdflag = "-command"
    vim.o.shellquote = '"' -- Adjust quoting if necessary
    vim.o.shellxquote = "" -- Adjust for command execution
end

-- Hide the 'how to disable mouse' menu item in right click menu
vim.cmd.aunmenu([[PopUp.How-to\ disable\ mouse]])
