"/**
"* @file _vimrc
"* @brief windows vim IDE configuration
"* @author Samuel Long
"* @version 1.0.1
"* @date 2013-10-23
"*/

"disable VI's compatible mode
set nocompatible
""插件的配置------------------------------------------------------------------
"Vundle Setup---------------------------------------------------------------{{{
"Vundle--Vim插件管理安装和设置
"见链接: Vundle for windows https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
"http://blog.csdn.net/zhuxiaoyang2000/article/details/8636472

filetype off "必须的
"此处规定Vundle的路径
"set rtp+=$VIM/vimfiles/bundle/vundle/
set rtp+=$VIM/vimfiles/bundle/vundle.vim/
"此处规定插件的安装路径
"call vundle#rc('$VIM/vimfiles/bundle/')
call vundle#begin('$VIM/vimfiles/bundle/')

"让 Vundle 管理 Vundle "必须的
"Plugin 'gmarik/vundle'
Plugin 'VundleVim/vundle'
"Plugin 'fencview.vim'

"color
Plugin 'vibrantink'
Plugin 'flazz/vim-colorschemes'
Plugin 'samueldsr/csExplorer'

"Language check (spell and grammar)
Plugin 'LanguageTool'

"syntax
Plugin 'asciidoc.vim'
Plugin 'html5.vim'
Plugin 'xml.vim'
Plugin 'c.vim'

"Python complete
"Plugin 'rkulla/pydiction'
"Programming syntax checking, relying on external program
Plugin 'scrooloose/syntastic'

"plugin
Plugin 'tpope/vim-repeat'
Plugin 'DoxygenToolkit.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'

"Plugin 'snipMate'
"Another powerful sinppet compatible with sinpMate UltiSnips
Plugin 'UltiSnips'
"update with sinppets
Plugin 'honza/vim-snippets'

Plugin 'Tagbar'
Plugin 'taglist.vim'

Plugin 'The-NERD-Commenter'
Plugin 'Tabular'
Plugin 'Chiel92/vim-autoformat'
Plugin 'The-NERD-tree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'minibufexpl.vim'
Plugin 'neocomplcache'
"Plugin 'neocomplcache-snippets_complete'
Plugin 'LargeFile'
"The version of Latex-Suite on vim-scripts.org is too old, use the latest version in my own
"respository on github.com 
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX' 
Plugin 'git@github.com:samueldsr/vim-latex-1.8.23.git'
Plugin 'Auto-Pairs'
Plugin 'Lokaltog/vim-powerline'
"The original showmarks plugin has some bugs, use this on my github instead
"Plugin 'ShowMarks'
Plugin 'git@github.com:samueldsr/ShowMarks'
Plugin 'gregsexton/VimCalc'
Plugin 'tpope/vim-surround'
" Author's Original Plugins  
" 不同代码源上的vim插件的安装和管理方法
"
" 代码源在github上的
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'tpope/vim-rails.git'
"
" 代码源在vim-scripts上的
" Plugin 'L9'
" Plugin 'FuzzyFinder'
"
" 代码源放在其他地方的
" Plugin 'git://git.wincent.com/command-t.git'
" ...
call vundle#end()
filetype plugin indent on     " Required 必须的，安装完Plugin后在设置文件类型开启
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed
"}}}

""Basic Option--------------------------------------------------------------{{{
""---------------------------------------------------------------------------------
"默认的vim设置
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

"autoload _vimrc
autocmd! bufwritepost _vimrc source %

let $PATH = $VIMRUNTIME.";".$PATH
"use my own abbreviation
source $VIM\abbreviation.vim

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}

""Encoding setup-----------------------------------------------------------{{{
"vim中文化,国际化，强制VIM内部编码为UTF-8,同时命令提示设置为zh_CN.UTF-8
"详解见http://www.ac.net.blog.163.com/blog/static/13649056201112041417651/
set enc=utf-8
set termencoding=cp936
set fenc=utf-8
set fencs=utf-8,ucs-bom,cp936,gb18030,gb2312,gbk,latin1,iso-8859-1
language messages zh_CN.UTF-8
"下面两行防止菜单栏乱码，注意顺序不能变
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"文本编码之间的转换需要借助iconv.dll,下载后放在gvim.exe同目录下即可
"帮助文档中文化执行 vimcdoc-1.8.0-setup.exe即可
"}}}

"Font and colorscheme setup----------------------------------------------------{{{
"use chinese help
set helplang=cn

" colorscheme must be set after loading vundle
"colorscheme zen
"colorscheme pleasant
"colorscheme eclipse
"colorscheme emacs
"colorscheme blacklight 
colorscheme blackboard 
"autocmd BufEnter *.tex colorscheme pleasant
"autocmd BufEnter *.tex colorscheme evening
autocmd BufEnter *.tex colorscheme ashen
"autocmd BufEnter *.py colorscheme blackboard

"设置字体和主题
if has("gui_running")
	"vim 只支持等宽字体
	set guifont=Consolas:h11
	"set guifont=Ubuntu\ Mono:h12
	"set guifont=Monaco:h10
	"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11,DejaVu\ Sans\ Mono:h12,Menlo\ Regular\ for\ Powerline:h12,Monaco:h13 "use DejaVu Sans Mono for english on win/liunux, Monaco for mac
  set guifontwide=Yahei_Mono:h11,SimHei:h11,Monaco:h12 "use SimHei for Chinese, Monaco for mac
	"set guifont=PragmataPro:h12
	"set guifont=Courier\ New:h11
	"colorscheme beauty256 
	"set colorschemes later for loading a colorschemes plugin"
endif
"}}}

"windows copy and paste map------------------------------------{{{
vmap <c-c> "*y
imap <c-v> <esc>"*p

"c-v conficts with visual mode vertical selection, cancel it
"nmap <c-v> "*p

"}}}
"set nobackup  "设置修改不要自动备份

let mapleader="," "设置<leader>为 , 号而不是默认的 \
let g:mapleader=","

"No annoying sound on errors---------------------------------------------
"set noerrorbells
"set novisualbell
"set t_vb=
"set tm=500

set history=500 "Sets how many lines of history VIM has to remember
set ruler "Always show current postion
set nu "设置显示行号
set rnu "设置显示先对行号"
set autochdir "自动切换目录为当前文件所在的目录

"search with ease---------------------------------------------------{{{
set hlsearch  "高亮显示搜索到的单词
set ignorecase smartcase "搜索是忽略大小写，但是有一个以上的大写字母是仍然大小写敏感
set magic "显示括号配对
set incsearch "find as you type search"
"set showmatch "插入括号时，短暂地跳转到匹配的括号
"set matchtime=2 "短暂地跳转到匹配括号的时间
"awesome cancel highlights after reseach, press esc key
nnoremap <esc> :noh<CR><esc>
"""}}}

"windows split and size adjust------------------------------------{{{
"resizing
nnoremap <c-left> 5<c-w><
nnoremap <c-right> 5<c-w>>
nnoremap <c-up> 3<c-w>+
nnoremap <c-down> 3<c-w>-

"Resize splits when the windows is resize
"au VimResized * :call WindowsResize()<CR>
au VimResized * :wincmd =
function! WindowsResize()
	execute "wincmd ="
	let s:bufNum1 = bufwinnr('-MiniBufExplorer-')
	if s:bufNum1 !=-1
		execute 'MiniBufExplorer'
	endif

	let s:bufNum2 = bufwinnr('NERD_tree_')
	if s:bufNum2 !=-1
		execute 'NERDTree'
	endif

	let s:bufNum3 = bufwinnr('__Tag_List__')
	if s:bufNum3 !=-1
		execute 'TlistOpen'
	endif

	let s:bufNum4 = bufwinnr("__Tagbar__")
	if s:bufNum4 !=-1
		execute 'TagbarOpen'
	endif
endfunction

"set new split windows position orders
"set splitbelow
"set splitright

"switch between windows with Ctrl+hjkl
"Ctrl+j confict with vim build-in ctrl-j withline move[n]
"cancel the build-in ctrl-j mapping
"let g:BASH_Ctrl_j = 'off'
"let g:C_Ctrl_j = 'off' 
"while ctrl-j conficts with latex-suite mapping (imaps.vim)jump to <+>, so use shift+hjkl
"instead
noremap <s-h> <c-w>h
noremap <s-j> <c-w>j
noremap <s-k> <c-w>k
noremap <s-l> <c-w>l

"navigate between tabs and buffers
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap tn :tabnext<cr>
nnoremap tp :tabnprev<cr>
nnoremap tt :tabnew<cr>

""}}}

set virtualedit+=block "please see h:virtualedit"

set cindent "使用c程序风格的缩进
set smartindent "开启新行时使用智能自动缩进

set shiftwidth=2 "设定<<和>>命令移动的宽度为4(cindent使用这个命令)
set tabstop=2 "设定tab长度为2个空格 
set smarttab "Be smart when use tabs
set expandtab "扩展tab为所设定的空格个数
set softtabstop=2
"smart backspace, configure backspace so it acts as it should be 
set backspace=start,indent,eol  

syntax on "自动语法高亮
filetype plugin indent on "开启插件
au Filetype html,python,javascript setl shiftwidth=4
au Filetype html,python,javascript setl tabstop=4
au Filetype html,python,javascript setl softtabstop=4
au Filetype java,php setl shiftwidth=4
au Filetype java,php setl tabstop=4
au Filetype python colorscheme blackboard

"使用Ctrl+i退出插入模式
inoremap <c-i> <Esc>

"敏捷大写
inoremap <C-u> <Esc>g<S-u>iwea

"fast source ._vimrc
nnoremap <silent> <leader>ss :source $VIM\_vimrc<CR>
"""}}}

" NERDtree-----------------------------------------------------------------{{{
" NERDtree的键盘启动F10快捷键
nnoremap <F10> :NERDTreeToggle<CR> 
let NERDTreeMouseMode=2
"}}}

"taglist-------------------------------------------------------------------{{{
" taglist插件的map <F9>键启动
nnoremap <F9> :TlistToggle<CR>
"自动跳转到taglist windows
nnoremap <leader>tl :TlistOpen<CR>
let Tlist_GainFocus_On_ToggleOpen=1 "打开是自动聚焦到taglist windows
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0  "打开文件是是否自动打开taglist windows
let Tlist_Auto_Update = 1 "文件更改是是否自动更新taglist
let Tlist_Close_On_Select = 0 "跳转到某个tag是是否自动关闭taglist
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1 "当只有taglist windows被打开是自动退出
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function' 
"}}}

"DoxygenTookit插件设置 "一个自动加上作者，licence,函数注释的插件-------{{{
"let g:DoxygenToolkit_blockHeader="---------------------------------"
"let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Samuel Long"
"常用命令
":DoxLic 输出licence
":DoxAuthor 输出作者信息
":Dox 输出函数注释信息
"}}}

""Ctags Setup--------------------------------------------------------------{{{
"configure tags -add addtional tags here or comment out not-used ones
"set tags +=$VIM\vimfiles\tags\cpp  "经过验证，帮助补全意义不大，而且速度不尽如人意
"build tags of your own project with <leader>bt, if your project is written in
"C++, you can use !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"insted to get more tags information.
nmap <silent> <leader>bt :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"}}}

"OmniCppComplete设置-------------------------------------------------------{{{
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"- 如果下拉菜单弹出，回车映射为接受当前所选项目，否则，仍映射为回车；
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
"- 如果下拉菜单弹出，CTRL-J映射为在下拉菜单中向下翻页。否则映射为CTRL-X CTRL-O
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
"- 如果下拉菜单弹出，CTRL-K映射为在下拉菜单中向上翻页，否则仍映射为CTRL-K
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
"}}}

"折叠设置------------------------------------------------------------------{{{
set foldmethod=marker
set diffexpr=MyDiff()
function! MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"}}}

"vim 和 mingw 在 windows下对C和CPP的自动编译运行和调试和运行-------{{{
nmap <silent><leader>gc :call Compile()<CR>
"define compile and run
func! Compile()
	exec "w"
	"case c file
	if &filetype == 'c'
		exec "!gcc % -g -o %<.exe"
		"case cpp file
	elseif &filetype == 'cpp'
		exec "!g++ % -g -o %<.exe"
	endif
endfunc

"define run function
func! Run()
	if &filetype == 'c' || &filetype == 'cpp'
		exec "!%<.exe"
	endif
endfunc
nmap <silent><leader>gr :call Run()<CR>

"define debug function
func! Debug() 
	exec "w"
	"case c file
	if &filetype == 'c'
		exec "!gcc % -g -o %<.exe"
		exec "!gdb %<.exe "
	elseif &filetype == 'cpp'
		exec "!g++ % -g -o %<.exe"
		exec "!gdb %<.exe "
	endif
endfunc
nmap <silent><leader>gd :call Debug()<CR>
"}}}

"LaTeX-Suite Settings--------------------------------------------------------{{{
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
"Set shellxquote will cause Vundle not working properly, ex, BundleInstall
"set shellxquote=""

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"}}}

"CSCOPE 的设置, 涉及到plugin下的 cscope_maps的一些快捷键设置----------------{{{
"详解见 http://www.vimer.cn/2009/10/%E5%9C%A8vimgvim%E4%B8%AD%E4%BD%BF%E7%94%A8cscope.html
"CScope database files generate quick mapping
nmap <leader>bct :call Do_CsTag()<CR>

function! Do_CsTag()
	if(executable('cscope') && has('cscope'))
		if has('unix')
			silent! execute "!find . -name '*.h' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
		else
			silent! execute "!dir /s/b *.h *.c *.cpp *.java *.cs >>cscope.files"
		endif
		silent! execute "!cscope -b"
		if filereadable("cscope.out")
			execute "cs add cscope.out"
		endif
	endif
endf
"}}}

""Tabular设置,文本对齐工具------------------------------------------------{{{
if exists(":Tabularize")
	nmap <leader>t= :Tabularize /=<CR>
	vmap <leader>t= :Tabularize /=<CR>
	nmap <leader>t: :Tabularize /:\zs<CR>
	vmap <leader>t: :Tabularize /:\zs<CR>
endif

" Make sure that proper indenting is maintained in Ruby files
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2

inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction
"}}}

""Vim Spell Check工具设置-----------------------------------------------{{{
"Toggle spell checking on and off with `,sc`
nmap <silent> <leader>sc :set spell!<CR>
"set default region to US English
set spelllang=en_us
"}}}

"autoformat-------------------------------------------------------------{{{
"命令模式下输入autoformat自动format,
"具体的format需要外部程序，放在autoformat插件目录下的formatter
"默认的有astyles: C/C++/C# 但是貌似不是很好看
"vim 自带的indent 更正工具为  gg=G
"}}}

"powerline设置----------------------------------------------------------{{{
set laststatus=2
"let g:Powerline_symbols = 'fancy'
"set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors,
"实际证明一般不需要，开启后可能失去statusbar的颜色设置
"}}}

"showmarks setup------------------------------------------------------------{{{
"set no show for "0-9{"\"}" marks
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" <leader>mt :open
" <leader>mm :next avaible marks
" <leader>ma :clear all marks
" <leader>mh :clear current marks
"}}}

"minibufexpl setup--------------------------------------------------{{{
let g:miniBufExplMaxHeight=2
"}}}

"simple calculator---------------------------------------------------------{{{
"Also, type :Calc to call a python interface cmd line as calculator
"Build-in insert mode simple calculation
imap <silent> <S-CR> <C-R>=string(eval(input("Calculate: ")))<CR>
"}}}

"Latex words count"{{{
nmap <silent> <leader>lwc :w<CR> :!detex % \| wc -w<CR>
"}}}

"vim hex file editing"{{{
nmap <silent> <leader>xxd :%!xxd <CR>
nmap <silent> <leader>xxr :%!xxd -r <CR>"}}}

"Language Tool for grammar checking"{{{
"set language standalone jar program location
let g:languagetool_jar=$VIM. '\LanguageTool-2.7\languagetool-commandline.jar'
let g:languagetool_lang='en-US'
"}}}

"Pydiction setup"{{{
let g:pydiction_location = '$VIM/vimfiles/bundle/pydiction/complete-dict'"}}}

" Syntastic setup--Syntax checking"{{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checkers=['pyflakes']
"disable pep8 check (style check)
"let g:syntastic_python_flake8_args='--ignore=E101,E111,E112,E113,E114,E115,E116,E121,E122,E123,E124,E125,E126,E127,E128,E129,E131,E133,E201,E202,E203,E211,E221,E222,E223,E224,E225,E226,E227,E228,E231,E241,E242,E251,E261,E262,E265,E266,E271,E272,E273,E274,E301,E302,E303,E304,E401,E402,E501,E502,E701,E702,E703,E704,E711,E712,E713,E714,E721,E731,E901,E902,W191,W291,W292,W293,W391,W503,W601,W602,W603,W604'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0"}}}
