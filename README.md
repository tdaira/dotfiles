# How setup MacOS environment

Download iTerm.

https://iterm2.com/

Download dotfiles.

```ssh
cd ~/
git clone git@github.com:tdaira/dotfiles.git
cp -r ./dotfiles/.* ./
```

Download fzf.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fzf
```

Download color scheme of iTerm.

```sh
curl -O https://raw.githubusercontent.com/Arc0re/Iceberg-iTerm2/master/iceberg.itermcolors
```

Apply color scheme to iTerm.

```
iTerm >> Preferences >> Profiles >> Colors tab >> Color Presets.. 
```

<img width="1040" alt="Screenshot1" src="https://github.com/tdaira/dotfiles/assets/7352689/ec5831b4-c808-4f27-93fa-9f70693bcd0a">


Apply start up command to execute tmux.

```
iTerm >> Preferences >> Profiles >> General >> Send text at start
```

```sh
tmux attach -t iterm || tmux new -s iterm
```

<img width="1030" alt="Screenshot2" src="https://github.com/tdaira/dotfiles/assets/7352689/e38c9d5d-6bd2-4cc9-9e82-4823cfc94510">


