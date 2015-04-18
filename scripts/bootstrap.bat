cd ../../../

cmd <<< "mklink /D .dotfiles Dropbox\dotfiles"

cmd <<< "mklink .bashrc .dotfiles\bash\.bashrc"
cmd <<< "mklink .bash_profile .dotfiles\bash\.bash_profile"

cmd <<< "mklink /D .vim Dropbox\Tools\Vim\.vim"
cmd <<< "mklink .vimrc .dotfiles\vim\vimrc.symlink"

cmd <<< "mklink /D .pentadactyl .dotfiles\pentadactyl\pentadactyl.symlink"
cmd <<< "mklink .pentadactylrc .dotfiles\pentadactyl\pentadactylrc.symlink"

cmd <<< "mklink /D .ssh Dropbox\Tools\Keys\.ssh"
