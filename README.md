# dotfiles
dotfiles collection ready to be used in combination with gnu stow.

- first install gnu stow and clone repository on machine
- then use stow to create symlinks to downloaded config files
- each subdir is a new package
- adding more configs by creating a subdir and then "recreating" the path to the target directory on the machine
  - e.g. nvim config
  - is stored in $HOME/.config/nvim/
  - dotfiles directory should look like this: dotfiles/nvim/.config/nvim

to install config files:
```
# from dotfiles directory:
stow <packagename>
```

the basic gnu stow commands are:
```
stow <packagename> # activates symlink
stow -n <packagename> # trial runs or simulates symlink generation. Effective for checking for errors
stow -D <packagename> # delete stowed package
stow -R <packagename> # restows package
```
