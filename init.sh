#!/bin/bash
# Setting up an Amazon Linux 2 Instance with the Deep Learning AMI
set -e -x

get_dotfiles () {

    echo "(1/4): GETTING DOTFILES..."
    git clone -b slim https://github.com/josiahdavis/dotfiles.git $HOME/dotfiles
    ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

}

setup_vim () {

    echo "(2/4) SETTING UP VIM..."
    # Install black for formatting
    pip3 install black

    # Install vim plug for package management
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Install packages
    vim +PlugInstall +qall

}

setup_tmux () {

    echo "(3/4) SETTING UP TMUX..."
    # Install tmux dependencies
    sudo yum -y install ncurses-devel
    sudo yum -y install libevent-devel

    # Get the latest version
    git clone https://github.com/tmux/tmux.git
    cd tmux
    sh autogen.sh
    sudo ./configure && sudo make install
    # Get a simple startup script
    sudo curl https://raw.githubusercontent.com/josiahdavis/aws-reference/master/start_tmux_simple.sh -o /bin/stm
    sudo chmod +x /bin/stm
    cd ..

}

setup_zsh () {

    echo "(4/4) SETTING UP ZSH..."
    sudo yum -y update && sudo yum -y install zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sudo yum -y install util-linux-user
    sudo chsh -s /bin/zsh ec2-user
    # Add conda to end of zshrc
    echo "source ~/.dlamirc" >> ~/.zshrc

}

get_dotfiles
setup_vim
setup_tmux
setup_zsh
