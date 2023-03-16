# Container recipe for NestJS projects
FROM node:lts

# Install Zsh, Oh my Zsh and other console tools and plugins
RUN apt update && apt install -y git fonts-powerline zsh curl vim less wait-for-it gettext zip
RUN zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k && \
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions && \
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting && \
    curl https://gist.githubusercontent.com/dmbarreiro/471a27073f26a7bade6816b873aed1b8/raw/75af38844b41850f70eed2ce2e0587fb492c9b61/.p10k.zsh --output ~/.p10k.zsh && \
    curl https://gist.githubusercontent.com/dmbarreiro/471a27073f26a7bade6816b873aed1b8/raw/75af38844b41850f70eed2ce2e0587fb492c9b61/.zshrc --output ~/.zshrc && \
    git config --global core.pager 'less -+F'
RUN chsh -s /bin/zsh
RUN npm i -g @nestjs/cli