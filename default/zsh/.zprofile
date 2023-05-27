# Global environment variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local"
export XDG_CACHE_HOME="$HOME/.cache"

export GOPATH="$HOME/.go"
export COMPOSER_HOME="$HOME/.composer"
export PERL5LIB="$HOME/.perl5/lib/perl5"
export PATH="$PATH:$GOPATH/bin:$HOME/.local/bin:$HOME/.composer/vendor/bin:$(ruby -e 'puts Gem.user_dir')/bin:$HOME/.perl5/bin:$XDG_DATA_HOME/JetBrains/Toolbox/scripts:$HOME/.cargo/bin"
export MANPATH="$MANPATH:$HOME/.perl5/man"

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
