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

### keyboard layout
The german keyboards have a somewhat necessary annoyance that to get any of the 3 characters ````, ^ or ~ you need to press the key twice (or follow it up with a space).
That's to allow the typing of accented characters like ã.
To disable that behaviour you may choose the layout ".. no dead keys".

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
Either use a version of vi compiled with the flags that supports the inline windows coc uses (nox vim) or use neovim.
1. download https://github.com/junegunn/vim-plug and copy it to either ~/.vim/autoload (normal vim) or ~/.config/nvim/autload
2. Install all vim plugins
    ``` 
    :PlugInstall 
    ```

3. Adapt the theme if required. If you chose material-darker you may want to change color08 / Bright Black to "90/90/90" to make comments etc more visible. File to adapt: $HOME/.config/base16-shell/scripts/base16- <your-prefered-theme> .sh

#### vim cheatsheet
| char(s)       | effect |
|---------------|--------|
| %             | find the next item in this line after or under the cursor and jump to its match. |
| C             | like d$a, delete to end of like then insert |
| 10j           | move 10 lines down
| 10G           | goto line 10 |
| CTRL-w j      | switch window to down (like hjkl)
| * OR #        | while * is select word and go to next one, # is backwards |
| CTRL-y OR     | scroll screen 1 line up / down |
| CTRL-e        | |
| "+y           | yank selected text to system register (available to CTRL-V) |
| gt OR gT      | change tab |
| ,o            | open file search (Plugin) |
| CTRL-t        | open selection from search in new tab |
| :tab help     | open help in other tab |
| / OR ?        | search forward or backwards. n and N repeat forward backwards |
| m[a-z]        | mark a position within a file |
| m[A-Z]        | mark a position globally |
| '             | jump to beginning of line of mark |
| ```` (1x)     | jump to mark |
| :delm a       | delete mark a |

### haskell neovim integration

1. make sure you have ghcup installed (https://www.haskell.org/ghcup/)
2. install nodejs
3. install npm/yarn
4. in vim do ```:CocInstall coc-json```


### meld
1. If you choose a dark system theme you may have to change meld to a dark color scheme aswell (my choice: Solarized-Dark)

## Contributing
Feel free to create a pull request.

## License
This project is released under the GPLv3 license.
