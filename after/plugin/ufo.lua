vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars:append { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }

-- Number suffixes on folded lines
require("ufo").setup({
  fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (" 󰁂 %d"):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0

    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)

      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, {chunkText, hlGroup})
        chunkWidth = vim.fn.strdisplaywidth(chunkText)

        -- String width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
        end

        break
      end
      curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, "MoreMsg"})
    return newVirtText
  end
})

-- Cleaner status column
local builtin = require("statuscol.builtin")
require("statuscol").setup {
  relculright = true,
  segments = {
    { text = {builtin.foldfunc}, click = "v:lua.ScFa" },
    { text = {"%s"}, click = "v:lua.ScSa" },
    { text = {builtin.lnumfunc, " "}, click = "v:lua.ScLa" }
  }
}
