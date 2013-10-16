"" Pathogen
   runtime bundle/vim-pathogen/autoload/pathogen.vim
   call pathogen#infect()

"" Slimv
   let g:slimv_swank_clojure='! xterm -e lein swank &'
   let g:lisp_rainbow=1
   let g:slimv_repl_syntax=1

"" Basics
   set nocompatible
   set hidden
   syntax on
   set encoding=utf-8
   set showcmd
   filetype plugin indent on
   let mapleader=","

"" Display
   set scrolloff=3
   set number
   set numberwidth=5
   set ruler
   set t_Co=256
   set background=dark
   colorscheme Tomorrow-Night
   set colorcolumn=80
   :hi ColorColumn ctermbg=red guibg=red
   set cursorline

"" Airline config
   let g:airline_enable_syntastic=1
   let g:airline_theme='dark'

"" Whitespace
   set nowrap
   set tabstop=2 shiftwidth=2
   set expandtab
   set backspace=indent,eol,start

"" Searching
   set hlsearch
   set incsearch
   set ignorecase
   set smartcase

"" Folding
   set foldmethod=syntax
   nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>

"" CtrlP
   map <leader>t :CtrlP<cr>
   map <leader>b :CtrlPBuffer<cr>
   let g:ctrlp_working_path_mode=2
   set wildignore+=*/*.swp
   let g:ctrlp_custom_ignore = '\v[\/]((\.(git|hg|svn))|(vendor/bundle)|(bin/stubs))$'

"" Misc
   map <leader>w :set wrap!<cr>
   set laststatus=2
   nmap <leader>c :ene<CR>:bw #<CR>

"" Spliting
   map <leader>\| :vsp<cr>
   map <leader>- :sp<cr>
   map <leader>_ :23sp<cr>

"" Cleanup ruby files on save
   function! GitStripSpace()
     let l:save_cursor = getpos(".")
     silent! %!git stripspace
     call setpos('.', l:save_cursor)
   endfunction

   autocmd Filetype ruby autocmd BufWritePre * call GitStripSpace()

"" Run specs from vim
   map <leader>S :call RunCurrentSpecFile()<CR>
   map <leader>s :call RunNearestSpec()<CR>
   map <leader>Z :call RunAllSpecs()<CR>
   let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
