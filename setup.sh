#!sh

echo 'Hello, world!'

curl https://sh.rustup.rs -sSf | sh

echo "export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=tool-versions" >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc

cp $HOME/.tool-versions $HOME/.global-tool-versions

sudo ln -s /opt/homebrew/bin/mkdir /opt/homebrew/bin/gmkdir
brew install luarocks
brew install composer
brew install julia
brew install pyenv --head
brew install fd
brew install lua-language-server
brew install rubyfmt

pip3 install --no-cache-dir --upgrade pynvim

gem update --system 3.5.14
gem install ruby-lsp-rubyfmt
gem install ruby-lsp-rspec
gem install neovim
