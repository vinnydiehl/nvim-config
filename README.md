# My Neovim Config

This is my personal Neovim configuration. I have it on here mostly to sync
between my computers, but it is public if anyone is interested. This is very
much intended to be an IDE-like setup useful across many languages, with a
large spectrum of features built around a `<space>` leader key.

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

## Caveats

This is not a community project, but might be a good starting point for someone
who would like a fully featured vim setup. Adjust to your preferences.

The only system-level thing that is specific to my setup is that I keep my all
of my projects in a `~/src` directory; this as well as `~/.config/nvim` and
`~/.config/zsh` are indexed by the [project
browser](https://github.com/nvim-telescope/telescope-project.nvim). You can
set which directories are indexed by the project browser in [this
file](https://github.com/vinnydiehl/nvim-config/blob/main/after/plugin/telescope.lua):

```lua
    repo = {
      list = {
        search_dirs = {
          "~/src",
          "~/.config/nvim",
          "~/.config/zsh"
        }
      },
      settings = { auto_lcd = true }
    }
```

If you remove the entire `list` attribute, it will index your entire home
directory. Leaving `auto_lcd` in place is recommended as it changes Neovim's
working directory when you switch projects, allowing fuzzy finding to work as
if you had launched from the project's root.
