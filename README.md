# Neovim Config

## Instructions

1. Clone this repository to `~/.config/nvim/`
2. Give `init.vim` a once-over, change the path to NodeJS under Configure Plugins below for example (I've added the comment ` TODO: Check Me` to the critical touch points)
3. Install the dependencies listed blow
4. Open NeoVIM, run :PlugInstall, then install Coc plugins as below

### Dependencies

- neovim >= 0.5 (Ubuntu - sudo add-apt-repository ppa:neovim-ppa/unstable)
- nerd font (https://www.nerdfonts.com/font-downloads)
- NodeJS >= 16
- npm i -g yarn eslint@5 prettier eslint-plugin-prettier eslint-config-prettier
  - (eslint 6 currently has trouble resolving plugins from global node_modules)
- fzf requires silversearcher-ag and ripgrep
- OS clipboard functions require handler (e.g. xclip on linux, or win32yank on Windows)
  - download win32yank (https://github.com/equalsraf/win32yank) and put the exe in WSL at `/usr/local/bin` (and `chmod +x` it)
- rnvimr file manager requires Ranger, pynvim, python3.6, and optionally ueberzug
- yay -S ranger python-pynvim ueberzug OR pip3 install ranger-fm pynvim ueberzug
- run `nvim +'chekhealth rnvimr'` from command line to validate
- Neovide GUI (Optional)
  - Check the font setting in `init.vim`, use a nerd font installed on your system
  - For Neovide on Windows, download the Windows exe and create a shortcut with the argument `--wsl`
  - For Neovide on Windows, set the correct path to Ranger in `init.vim`

### Coc Plugins

```txt
:CocInstall coc-tsserver coc-eslint coc-html coc-css coc-prettier coc-json coc-markdownlint coc-highlight coc-jest coc-marketplace
:CocInstall coc-yaml coc-toml coc-xml coc-tailwindcss coc-svg coc-styled-components coc-docker coc-snippets coc-git
```
