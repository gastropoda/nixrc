extend_dir_list PATH ~/.rbenv/bin
# without this (at least) rbenv will get confused
PATH=${PATH//.\/bin:}
have_exe rbenv && eval "$(rbenv init -)"

extend_dir_list PATH ~/bin
extend_dir_list PATH ~/.bin
extend_dir_list PATH ~/.dynamic-colors/bin
# cabal/haskell (for pandoc)
extend_dir_list PATH ~/.cabal/bin
# python modules installed with ./setup.py install --user
extend_dir_list PATH ~/.local/bin
extend_dir_list PATH ~/src/gopath/bin

# make sysadmins hate me
# this is useful for projects with local binstubs
# TODO move to a dev tag?
PATH=./bin:$PATH

