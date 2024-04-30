-- -- -- user commands -- -- --
-- nice when reading help docs
-- keep the cursor centred (should rewrite as lua)
vim.api.nvim_create_user_command('CenterCursorEnable',
[[let &scrolloff=(winheight(win_getid())/2)+1 |
execute 'normal zz' |
augroup VCenterCursor |
  au! |
  au BufEnter,WinEnter,WinNew,VimResized,WinResized *
    let &scrolloff=(winheight(win_getid())/2)+1 |
augroup END
]],
{})

vim.api.nvim_create_user_command('CenterCursorDisable',
function()
    vim.api.nvim_clear_autocmds({group = "VCenterCursor"})
    vim.opt.scrolloff=10
end, {})

vim.api.nvim_create_user_command('SpellfileRegen',
function()
    local path = vim.fn.stdpath('config') .. '/spell'
    vim.cmd('mkspell! ' .. path .. '/en.utf-8.add.spl ' .. path .. '/en.utf-8.add')
end, {})

-- common typo when quitting and writing
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('W', 'w', {})
