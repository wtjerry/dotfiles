# Installation
In your $HOME do 
```sh 
git clone <this-repo> . 
```


# Necessary manual steps
The following steps are necessary to make certain tools work as intended.
In the future they may be automated. (famous last words of a programmer)

## zsh
1. Install all zsh plugins if this was not already done automatically
    ``` 
    zplug install 
    ```

2. Change to your prefered theme (my choice: material-darker)
    ```
    base16_<your-prefered-theme>
    ```

## vim
1. Install all vim plugins
    ``` 
    :PlugInstall 
    ```

2. Adapt the theme if required. If you chose material-darker you may want to change color08 / Bright Black to "90/90/90" to make comments etc more visible. File to adapt: $HOME/.config/base16-shell/scripts/base16-<your-prefered-theme>.sh


