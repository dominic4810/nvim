local colorscheme = "kanagawa-dragon"

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
vim.cmd('hi BufferVisible guibg=bg')
vim.cmd('hi BufferCurrent guibg=fg guifg=bg')
vim.cmd('hi BufferCurrentMod guibg=fg guifg=darkred')
