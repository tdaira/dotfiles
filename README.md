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
