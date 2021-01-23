" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Change dates fast
  Plug 'tpope/vim-speeddating'
  " Files
  Plug 'tpope/vim-eunuch'
  " Repeat stuff
  Plug 'tpope/vim-repeat'
  " Surround
  Plug 'tpope/vim-surround'
  " Better Comments
  Plug 'tpope/vim-commentary'
  Plug 'jpalardy/vim-slime'
  " auto set indent settings
  Plug 'tpope/vim-sleuth'
    " Text Navigation
    Plug 'justinmk/vim-sneak'
    Plug 'unblevable/quick-scope'
    " Add some color
    Plug 'junegunn/rainbow_parentheses.vim'
    " Cool Icons
    Plug 'ryanoasis/vim-devicons'
    " Auto pairs for '(' '[' '{' 
    Plug 'jiangmiao/auto-pairs'
    " Themes
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " Terminal
    " Snippets
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" function! BuildFsharpLanguageServer1(info)
" !npm install && dotnet build -c Release
" endfunction

" function! BuildFsharpLanguageServer2(info)
" !dotnet tool restore && dotnet fake build --target LocalRelease
" endfunction


let g:LanguageClient_serverCommands = {
    \ 'fsharp': ['dotnet', '/home/phage/.config/nvim/autoload/plugged/fsharp-language-server/src/FSharpLanguageServer/bin/Release/netcoreapp3.0/target/FSharpLanguageServer.dll']
    \ }
