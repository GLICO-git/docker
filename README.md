# docker
For my docker container setup

# image build
``` 
docker build -t [image name]:[tag] .
docker images
```

# docker run
```
docker run -it --name [container name] [image name]:[tag]
```

# in container
your pwd is /root/
your nvim setting file exists in /root/.config/nvim/

just exec setup_in_docker.sh twice
(First attempt for installing oh-my-zsh,
Second for installing the rest)

```
sh /root/.config/nvim/setup_in_docker.sh
```

# After setting up nvim
```
vi /root/.config/nvim/lua/user/plugins.lua
:w (packer install automatic)
:TSUpdate c lua
:CocInstall coc-clangd
:checkhealth nvim-treesitter
:q
```

# trigger p10k
editting theme "powerlevel10k/powerlevel10k" in .zshrc
```
vi ~/.zshrc
source ~/.zshrc
```
