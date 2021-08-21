" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"if has("syntax")
"  syntax on
"endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

"===================================================================
autocmd! BufWritePost ~/.vimrc source ~/.vimrc
"===========================
"  文件设置
"===========================
set nobackup        " 不要备份
set noundofile      " 不生成undo文件
set noswapfile
set nowritebackup

set nu          " 显示行号
set history=500     " 保留历史记录
set backspace=2     " 退格键可用
"===========================
" 插件设置
"===========================
"call plug#begin('~/.vim/plugged')
"Plug 'skywind3000/vim-preview'
"Plug 'preservim/nerdcommenter'
"call plug#end()

"source /mnt/e/wsl/gnu-global/6.6.4/usr/local/share/gtags/gtags.vim

"autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
"autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

"===========================
"代码显示
"===========================
syntax on "打开语法高亮
set showmatch "设置匹配模式，相当于括号匹配

filetype on
" 开启自动识别文件类型，并根据文件类型加载不同的插件和缩进规则
filetype plugin indent on

set autoindent
" 修正 vim 删除/退格键行为
" 原生的 vim 行为有点怪：
" 如果你在一行的开头切换到插入模式，这时按退格无法退到上一行
" 如果你在一行的某一列切换到插入模式，这时按退格无法退删除这一列之前的字符
" 如果你开启了 autoindent，按回车时 vim 会根据上一行自动缩进，这时按退格无法删除缩进字符
" 通过设置 eol, start 和 indent 可以修正上述行为
set backspace=eol,start,indent
" vim 默认使用单行显示状态，但有些插件需要使用双行展示，不妨直接设成 2
set laststatus=2
" 高亮第 80 列，推荐
"set colorcolumn=80
" 高亮光标所在行，推荐
" 有人还会高亮当前列，可以通过 set cursorcolumn 开启，但有点过了，不推荐
"set cursorline
" 显示窗口比较小的时候折行展示，不然需要水平翻页，推荐
set wrap
set tabstop=4

syntax enable
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ruler

" 关闭括号匹配时光标的跳动
set noshowmatch
"===========================
"查找/替换相关的设置
"===========================
set hlsearch "高亮显示查找结果
set incsearch "增量查找
set ignorecase

"===========================
"键盘映射
"===========================
set belloff=all


" https://vi.stackexchange.com/questions/15182/copying-from-vim-to-ubuntu-bash-on-windows
" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " default location
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end
