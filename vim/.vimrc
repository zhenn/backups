" ~/.vimrc by zhenn <zhenn.life@gmail.com> 
" http://zhenn.github.com
"
set nocompatible        " Use Vim defaults (much better!)

"Default backspace like normal
set backspace=indent,eol,start

set viminfo='20,\"50    " read/write a .viminfo file, don't store more
set formatoptions=mtcql

au BufNewFile,BufRead * set foldlevel=99

"设置zencoding插件展开代码快捷键为ctrl+e
let g:user_zen_expandabbr_key = '<c-e>'    
let g:use_zen_complete_tag = 1

" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

"折叠配置
set fdm=manual

highlight Folded ctermbg=darkgray ctermfg=lightmagenta

if has ( "autocmd" )
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal g'\"" |
	\ endif
endif  " has ("autocmd") 


" Editor config
"
"

" 鼠标滚轮的事件
" just for gvim
if has("gui_running")
	"color lucius
	au GUIEnter * cd ~
	set cursorcolumn
	map <MiddleMouse> <Nop>
	set cursorline
else
	set showtabline=2
	"color vj
endif

" 字体设置
if has("unix") && !has("mac")
	set guifont=Inconsolata\ Medium\ 11
	set guifontwide=WenQuanYi\ Micro\ Hei\ Mono\ Medium\ 10
endif
if has("mac")
	set guifont=Monaco:h13
endif

" 文件设置
filetype on
filetype plugin on
filetype indent on


" js文件格式化，Shift-b
map <S-b> :call g:Jsbeautify()<CR>



"by jay

"编辑器样式hack
hi Comment      term=bold ctermfg=darkcyan
hi Constant     term=underline ctermfg=Red
hi Special      term=bold ctermfg=Magenta
hi Identifier   term=underline ctermfg=cyan
hi Statement    term=bold ctermfg=Brown
hi PreProc      term=bold ctermfg=DarkYellow
hi Type         term=bold ctermfg=DarkGreen
hi Ignore       ctermfg=white
hi Error        term=reverse ctermbg=Red ctermfg=White
hi Todo         term=standout ctermbg=Yellow ctermfg=Red
hi Search       term=standout ctermbg=Yellow ctermfg=Black
hi ErrorMsg     term=reverse ctermbg=Red ctermfg=White
hi StatusLine   ctermfg=darkblue  ctermbg=gray
hi StatusLineNC ctermfg=brown   ctermbg=darkblue


"鼠标隐藏
set mouse=v

"高亮搜索结果
set incsearch
set hlsearch

"显示行号
set nu

"状态栏
set laststatus=2
set statusline=%<[%n]\ %F\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}][ASCII=\%03.3b]\ %-10.(%l,%c%V%)\ %P

"欢迎文字
autocmd VimEnter * echo "Welcome back :)"
autocmd VimLeave * echo "Byebye."

"一个tab占4个空格
set ts=4
set sw=4

"自动缩进动作，粘贴自动缩进
set smartindent
"自动缩进长度
set cino=:0g0               

"长句在单词间折行
set wrap

"搜索忽略大小写
set ignorecase

"编辑源备份
set backupcopy=yes

"编辑模式自动缩进
set autoindent 
"记录历史
set history=150 
"标尺
set ruler
"显示不完整的命令
set showcmd
" Added to default to high security within Gentoo. Fixes bug #14088
set modelines=0

"文件编码
set fileencodings=ucs-bom,utf-8,GB18030,gbk
"gui字体，随意模式
set guifontset=*-r-*

"语法高亮
syntax enable
syntax on

"F功能键定义
map <F2> <ESC>zA<CR>            
map <F3> <ESC>*
map <F11> :bp<CR>              
map <F12> :bn<CR>               
map <F7> <ESC>:wa<CR>:make<CR>
map <F8> <ESC>"0p

"tab操作多文件
map <C-t> :tabnew 
nmap wm :tabnew .<CR>
"nmap wm :NERDTreeToggle<CR>
map <Tab> :tabnext<CR> 
map <S-Tab> :tabprevious<CR>

"使用 Ctrl+C 或者 Y 复制到系统剪贴板
vnoremap <C-C> "+y
vnoremap Y "+y

"快速左右移动光标
map <C-l> <ESC>10l
map <C-h> <ESC>10h

"tab尺寸
set shiftwidth=4
set tabstop=4   "tab

"tab自动补全
function! CleverTab()
if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
		else
		return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"退出模式
set t_ti=
set t_te= 

let mapleader = ","

"选择编辑器主题
"colorscheme evening
"colorscheme blue
"colorscheme darkblue
"colorscheme default
"colorscheme delek
colorscheme desert
"colorscheme elflord
"colorscheme darkburn  "依赖.vim/colors/darkburn.vim
"colorscheme evening
"colorscheme koehler
"colorscheme morning
"colorscheme murphy
"colorscheme pablo
"colorscheme peachpuff
"colorscheme ron
"colorscheme shine
"colorscheme torte
"colorscheme zellner
"colorscheme gemcolors 

"编辑器主题样式hack，针对evening
"hi StatusLine	cterm=bold ctermbg=blue ctermfg=white guibg=gold guifg=blue
"hi StatusLineNC	cterm=bold ctermbg=blue ctermfg=black guibg=gold guifg=blue
"hi TabLine cterm=bold ctermbg=lightgray ctermfg=black guibg=gold guifg=blue
"hi TabLineSel cterm=bold ctermbg=darkblue ctermfg=white guibg=gold guifg=blue
"hi CursorLine cterm=bold ctermbg=darkgray guibg=gold guifg=blue

"hack for elflord 
hi StatusLine	cterm=bold ctermbg=darkgray ctermfg=white guibg=gold guifg=blue

"显示tab line
"set showtabline=2

"最大tab个数
set tabpagemax=20


"set cursorline
":hi cursorline ctermbg=Yellow

"darkburn 颜色设置
"set t_Co=256

"对所有文件设置关键字提示
set dictionary-=~/.vim/dict/dict.txt dictionary+=~/.vim/dict/dict.txt
set complete-=k complete +=k

:filetype plugin on 

au BufRead,BufNewFile *.less set filetype=css


