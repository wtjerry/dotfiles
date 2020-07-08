# dot files
This project contains a collection of configuration files to setup a Linux system to my liking.
Altough it may also work for other systems, these configurations are only tested on Debian and Arch Linux.

## Usage
In your $HOME do 
```sh 
git clone <this-repo> . 
```

## Necessary manual steps
The following steps are necessary to make certain tools work as intended.
In the future they may be automated. (famous last words of a programmer)

### clone base16
    ```
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
    ```

### zsh
1. Clone zplug
    ```
    git clone https://github.com/zplug/zplug .zplug
    ```
2. Install all zsh plugins if this was not already done automatically
    ``` 
    zplug install 
    ```

3. Change to your prefered theme (my choice: solarflare)
    ```
    base16_<your-prefered-theme>
    ```

### vim
1. Install all vim plugins
    ``` 
    :PlugInstall 
    ```

2. Adapt the theme if required. If you chose material-darker you may want to change color08 / Bright Black to "90/90/90" to make comments etc more visible. File to adapt: $HOME/.config/base16-shell/scripts/base16-<your-prefered-theme>.sh

### haskell neovim integration
download and chmod nvim.appimage from https://github.com/neovim/neovim/releases/ to wherever the alias in .aliases is configured.

Install ghcup as described on https://www.haskell.org/ghcup/

Install the haskell-language server
    ```
    git clone https://github.com/haskell/haskell-language-server --recurse-submodules
    cd haskell-language-server
    stack install (and make sure ~/.local/bin is on your $PATH)
    ```
It's important that ghcide is compiled with the same compiler you use to build your projects.

in vim do ```:CocInstall coc-json```


### meld
1. If you choose a dark system theme you may have to change meld to a dark color scheme aswell (my chose: Solarized-Dark)

## Contributing
Feel free to create a pull request.

## License
This project is released under the GPLv3 license.
