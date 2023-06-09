# My Neovim Config

## Install

This configuration is built upon [the version of Neovim in the Arch
Extra Repository](https://archlinux.org/packages/extra/x86_64/neovim/). You may
need to use an [AppImage](https://github.com/neovim/neovim/releases) or [build
from source](https://github.com/neovim/neovim/wiki/Building-Neovim) if the
nightly builds are not available on your package manager.

### Dependencies

 * [fd](https://github.com/sharkdp/fd)
 * [glow](https://github.com/charmbracelet/glow)
 * [ripgrep](https://github.com/BurntSushi/ripgrep)

### Setup

Clone this repo into the config location:

```sh
git clone https://github.com/vinnydiehl/nvim-config.git ~/.config/nvim
```

Install [Packer](https://github.com/wbthomason/packer.nvim):

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Before launching for the first time, move the `after/` directory out of there
to avoid a bunch of errors from uninstalled plugins being called:

```sh
mv ~/.config/nvim/after ~/aftertmp
```

Launch Neovim and run `:PackerSync`, wait for everything to finish, and then
move the `after/` directory back into place:

```sh
mv ~/aftertmp ~/.config/nvim/after
```

Relaunch Neovim and it will install a few basic LSPs. You can see which LSPs
are installed in the `lsp.ensure_installed()` call near the top of [this
file](https://github.com/vinnydiehl/nvim-config/blob/main/after/plugin/lsp.lua)-
if you would like to manage these manually, you can remove this entire function
call and manage your LSPs with `:Mason`.
