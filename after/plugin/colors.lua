function InitColors(color)
  color = color or "zenburn"
  vim.cmd.colorscheme(color)
end

InitColors()
