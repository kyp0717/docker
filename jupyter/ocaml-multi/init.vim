"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Always source these
source $HOME/.config/nvim/plugins.vim
" source $HOME/.config/nvim/settings.vim
" source $HOME/.config/nvim/functions.vim
" source $HOME/.config/nvim/mappings.vim

" source $HOME/.config/nvim/gruvbox.vim
" source $HOME/.config/nvim/airline.vim
" source $HOME/.config/nvim/fzf.vim
" source $HOME/.config/nvim/quickscope.vim
" source $HOME/.config/nvim/sneak.vim


let g:slime_target = "tmux"

if !empty(glob("./paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif
let g:polyglot_disabled = ['csv']

" Python
" https://realpython.com/python-debugging-pdb/ " breakpoint syntax is really cool
" also look into profiling as well
" let g:python_highlight_all=1
