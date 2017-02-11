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
set rtp+=~/.vim/bundle/Vundle.vim/
"此处规定插件的安装路径
call vundle#begin()

"让 Vundle 管理 Vundle "必须的
"Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'
"Plugin 'fencview.vim'

"color
Plugin 'vibrantink'
Plugin 'flazz/vim-colorschemes'
Plugin 'samueldsr/csExplorer'
"Plugin 'altercation/vim-colors-solarized'

"Language check (spell and grammar)
"Plugin 'LanguageTool'

"syntax
Plugin 'asciidoc.vim'
Plugin 'othree/html5.vim'
Plugin 'xml.vim'

"c.vim is a IDE for c developper, 
"it provides snippets, syntax checking, auto complete 
"fuctionality, but better not use this one, use other
"as Syntastics, ultisnip, youcomplete is a more elegant
"way
"Plugin 'c.vim'

"Python complete
"Plugin 'rkulla/pydiction'
"Programming syntax checking, relying on external program
Plugin 'scrooloose/syntastic'

"plugin
Plugin 'tpope/vim-repeat'
Plugin 'DoxygenToolkit.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-vinegar'

"Snippets---------------------------------------------------"{{{
"Plugin 'snipMate'
"Another powerful sinppet compatible with sinpMate UltiSnips
Plugin 'SirVer/ultisnips'
"update with online sinppets
Plugin 'honza/vim-snippets'"}}}

"Taglist and Tagbar both provides functionality for show"{{{
"tags in a sidebar windows, however, taglist is outdated
"and tagbar offers better performance for object-oriented
"language, so use tagbar instead of taglist
Plugin 'Tagbar'
"Plugin 'taglist.vim'"}}}

Plugin 'The-NERD-Commenter'

"Smart find files
Plugin 'kien/ctrlp.vim'
Plugin 'Tabular'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Lokaltog/vim-easymotion'
"Better replace nerd tree with the native netrw
"Plugin 'The-NERD-tree'
"Minibuf always has some problems with the opening buffer in split windows,
"better abondon it and use other buffer managing such as vim-airlines, ctrlp
"or built-in buffer managing commands
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'minibufexpl.vim'
"Plugin 'jlanzarotta/bufexplorer'
Plugin 'LargeFile'
Plugin 'Auto-Pairs'
Plugin 'tpope/vim-surround'

"---Auto complete--------------------------------------------------------"{{{
"It is the complete version of neocomplcache, using ctags to achieve auto
"complete
"Requirements: Lua support of VIM
"Plugin 'Shougo/neocomplete.vim'
"Very slow with my computer
"Plugin 'samueldsr/youcompleteme-win7-gvim'"}}}
"Plugin 'Valloric/YouCompleteMe'

"Python completion, depend on jedi, use <pip install jedi> to install jedi
Plugin 'davidhalter/jedi-vim'

"The version of Latex-Suite on vim-scripts.org is too old, use the latest version in my own
"respository on github.com
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'git@github.com:samueldsr/vim-latex-1.8.23.git'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'ShowMarks'  "A bug fix version is on my git repo
"The original showmarks plugin has some bugs, use this on my github instead
"Plugin 'git@github.com:samueldsr/ShowMarks'
Plugin 'SamuelDSR/ShowMarks'
Plugin 'gregsexton/VimCalc'

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
"behave mswin

"autoload .vimrc
autocmd! bufwritepost .vimrc source %

"use my own abbreviation
"source $VIM\abbreviation.vim

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
"set termencoding=utf-8
set termencoding=cp936
set fenc=utf-8
set fencs=utf-8,ucs-bom,cp936,gb18030,gb2312,gbk,latin1,iso-8859-1
"language messages zh_CN.UTF-8
"下面两行防止菜单栏乱码，注意顺序不能变
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"文本编码之间的转换需要借助iconv.dll,下载后放在gvim.exe同目录下即可
"帮助文档中文化执行 vimcdoc-1.8.0-setup.exe即可
"}}}

"Font and colorscheme setup----------------------------------------------------{{{
"use chinese help
"set helplang=cn

" colorscheme must be set after loading vundle
"colorscheme zen
"colorscheme pleasant
"colorscheme eclipse
"colorscheme evening 
"colorscheme emacs
"colorscheme blacklight
"colorscheme blackboard
colorscheme 256-jungle
"syntax enable
"set background=dark
"colorscheme solarized
"colorscheme blackboard

"autocmd BufEnter *.tex colorscheme pleasant
"autocmd BufEnter *.tex colorscheme evening
"autocmd BufEnter *.tex colorscheme ashen
"autocmd BufEnter *.py colorscheme blackboard


"设置GVIM字体和主题, guifont只支持GVIM
"if has("gui_running")
	"vim 只支持等宽字体
	"set guifont=Consolas:h11
  "set guifont=Ubuntu\ Mono:h12
	"set guifont=Monaco:h10
	"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11,DejaVu\ Sans\ Mono:h12,Menlo\ Regular\ for\ Powerline:h12,Monaco:h13 "use DejaVu Sans Mono for english on win/liunux, Monaco for mac
  "set guifontwide=Yahei_Mono:h11,SimHei:h11,Monaco:h12 "use SimHei for Chinese, Monaco for mac
	"set guifont=PragmataPro:h12
	"set guifont=Courier\ New:h11
	"colorscheme beauty256 
	"set colorschemes later for loading a colorschemes plugin"
"endif
"}}}

"windows copy and paste map------------------------------------{{{
"vmap <c-c> "*y
"imap <c-v> <esc>"*p

"c-v conficts with visual mode vertical selection, cancel it
"nmap <c-v> "*p

"}}}

"----backup---------------------------------------------------------------"{{{
"set writebackup "写入文件前先备份，写入成功后删除备份
"set nobackup  "设置修改不要自动备份
"set backupext=.bak
"set backupdir=path"}}}

let mapleader="," "设置<leader>为 , 号而不是默认的 \
let g:mapleader=","

"No annoying sound on errors---------------------------------------------
set noerrorbells
"set novisualbell
"set t_vb=
"set tm=500

set history=500 "Sets how many lines of history VIM has to remember
set ruler "Always show current postion
set nu "设置显示行号
set rnu "设置显示相对对行号，当前行号显示，上下加减
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
"au VimResized * :wincmd =
"function! WindowsResize()
	"execute "wincmd ="
	"let s:bufNum1 = bufwinnr('-MiniBufExplorer-')
	"if s:bufNum1 !=-1
		"execute 'MiniBufExplorer'
	"endif

	"let s:bufNum2 = bufwinnr('NERD_tree_')
	"if s:bufNum2 !=-1
		"execute 'NERDTree'
	"endif

	"let s:bufNum3 = bufwinnr('__Tag_List__')
	"if s:bufNum3 !=-1
		"execute 'TlistOpen'
	"endif

	"let s:bufNum4 = bufwinnr("__Tagbar__")
	"if s:bufNum4 !=-1
		"execute 'TagbarOpen'
	"endif
"endfunction

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
"nnoremap tn :tabnext<cr>
"nnoremap tp :tabnprev<cr>
"nnoremap tt :tabnew<cr>

""}}}

"Tab and indent settings---------------------------------------------------------------"{{{
set virtualedit+=block "please see h:virtualedit"
set cindent "使用c程序风格的缩进
set smartindent "开启新行时使用智能自动缩进

set shiftwidth=4 "设定<<和>>命令移动的宽度为4(cindent使用这个命令)
set tabstop=4 "设定tab长度为2个空格 
set smarttab "Be smart when use tabs
set expandtab "扩展tab为所设定的空格个数
set softtabstop=4
"smart backspace, configure backspace so it acts as it should be 
set backspace=start,indent,eol  

syntax on "自动语法高亮
filetype plugin indent on "开启插件

"au Filetype html,python,javascript setl shiftwidth=2
"au Filetype html,python,javascript setl tabstop=2
"au Filetype html,python,javascript setl softtabstop=2
au Filetype java,php setl shiftwidth=4
au Filetype java,php setl tabstop=4
"au Filetype python colorscheme blackboard
"}}}

"使用Ctrl+i退出插入模式
inoremap <c-i> <Esc>

"敏捷大写
inoremap <C-u> <Esc>g<S-u>iwea

"fast source ._vimrc
nnoremap <silent> <leader>ss :source ~/.vimrc<CR>

"fast run python file from vim
"nnoremap <silent> <leader>pr :exec '!python' shellescape(@%,1)><cr>
nnoremap <silent> <leader>pr :!python %<cr>
"""}}}

"Buffer keymapping------------------------------------------------------------------------"{{{
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>bn :bnext<CR>

" Move to the previous buffer
nmap <leader>bp :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
"nmap <leader>bl :ls<CR>"}}}

"tagbar--A better way to show tags, only works for Gvim---------------------------------------------------------"{{{
"tagbar needs ctags.exe to generate tags, put ctages.exe in the vim runtime
"folder, or let Tagbar know the location of ctages.exe or by setting 
"let g:tagbar_ctags_bin='path to ctage.exe'
"
"In tagbar windows:
"press <s> to change the sorting orders of tags <by name> or <by order in file>
"press <Enter> to jump to the tag under the cursor
"press <p> to jumo the tag under the cursor while stay in the Tagbar window
"press <+/zo> to open folder
"press <-/zc> to close folder
"nnoremap <F9> :TagbarToggle<CR>
"let g:tagbar_autoclose=0 "tagbar close when you jump to a tag, default 0
"let g:tagbar_width=45 "tagbar window width, default 40
"let g:tagbar_left=0 "tagbar windows on left of right, (default on right)
"for more settings, see h: tagbar"}}}

"DoxygenTookit插件设置 "一个自动加上作者，licence,函数注释的插件-------{{{
"let g:DoxygenToolkit_blockHeader="---------------------------------"
"let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Samuel Long"
"常用命令
":DoxLic 输出licence
":DoxAuthor 输出作者信息
":Dox 输出函数注释信息
"}}}

""Ctags Setup,--<leader>bt--build tags----------------------------------------------------{{{
"configure tags -add addtional tags here or comment out not-used ones
"set tags +=$VIM\vimfiles\tags\cpp  "经过验证，帮助补全意义不大，而且速度不尽如人意
"build tags of your own project with <leader>bt, if your project is written in
"C++, you can use !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"insted to get more tags information.
"set tags +=./tags,tags
"nmap <silent> <leader>bt :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"}}}

"CSCOPE 的设置, --<leader>bct--build cscope tags----------{{{
"详解见 http://www.vimer.cn/2009/10/%E5%9C%A8vimgvim%E4%B8%AD%E4%BD%BF%E7%94%A8cscope.html
"CScope database files generate quick mapping
"nmap <leader>bct :call Do_CsTag()<CR>

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

"Fold setup------------------------------------------------------------------{{{
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
"using different compile setting for c++98 and c++11
"nmap <silent><leader>gc :call Compile()<CR>
"define compile and run
func! Compile()
	exec "w"
	"case c file
	if &filetype == 'c'
		exec "!gcc % -g -o %<.exe"
		"case cpp file
	elseif &filetype == 'cpp'
    let _f_ext = expand('%:e')
    "c++ 98
    if _f_ext == 'cpp' || _f_ext == 'cc'
      exec "!g++ % -g -o %<.exe"
    "c++ 11
    elseif _f_ext == 'cxx'
		  exec "!g++ % -std=c++11 -g -o %<.exe"
    endif
	endif
endfunc

"define run function
func! Run()
	if &filetype == 'c' || &filetype == 'cpp'
		exec "!%<.exe"
	endif
endfunc
"nmap <silent><leader>gr :call Run()<CR>

"define debug function
func! Debug() 
	exec "w"
	"case c file
	if &filetype == 'c'
		exec "!gcc % -g -o %<.exe"
		exec "!gdb %<.exe "
	elseif &filetype == 'cpp'
    if expand('%:e') == 'cpp' || expand('%:e') == 'cc'
		  exec "!g++ % -g -o %<.exe"
		  exec "!gdb %<.exe "
    elseif expand('%:e') == 'cxx'
		  exec "!g++ % -std=c++11 -g -o %<.exe"
		  exec "!gdb %<.exe "
    endif
	endif
endfunc
"nmap <silent><leader>gd :call Debug()<CR>
"}}}

"LaTeX-Suite Settings--------------------------------------------------------{{{
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash
"Set shellxquote will cause Vundle not working properly, ex, BundleInstall
"set shellxquote=""

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
"set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
"let g:tex_flavor='latex'
"}}}

""Tabular设置,文本对齐工具------------------------------------------------{{{
if exists(":Tabularize")
	nmap <leader>t= :Tabularize /=<CR>
	vmap <leader>t= :Tabularize /=<CR>
	nmap <leader>t: :Tabularize /:\zs<CR>
	vmap <leader>t: :Tabularize /:\zs<CR>
endif

" Make sure that proper indenting is maintained in Ruby files
"setlocal shiftwidth=2
"setlocal softtabstop=2
"setlocal tabstop=2

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
"nmap <silent> <leader>sc :set spell!<CR>
"set default region to US English
"set spelllang=en_us
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
" <leader>mc :clear current marks

"if !hasmapto( '<Plug>ShowmarksShowMarksToggle' ) | map <silent> <unique> <leader>mt :ShowMarksToggle<cr>|    endif
"if !hasmapto( '<Plug>ShowmarksShowMarksOn'     ) | map <silent> <unique> <leader>mo :ShowMarksOn<cr>|        endif
"if !hasmapto( '<Plug>ShowmarksClearMark'       ) | map <silent> <unique> <leader>mc :ShowMarksClearMark<cr>| endif
"if !hasmapto( '<Plug>ShowmarksClearAll'        ) | map <silent> <unique> <leader>ma :ShowMarksClearAll<cr>|  endif
"if !hasmapto( '<Plug>ShowmarksPlaceMark'       ) | map <silent> <unique> <leader>mm :ShowMarksPlaceMark<cr>| endif
" <leader>mh :clear current marks
"}}}

"minibufexpl setup--------------------------------------------------{{{
"let g:miniBufExplMaxHeight=2
"}}}

"simple calculator---------------------------------------------------------{{{
"Also, type :Calc to call a python interface cmd line as calculator
"Build-in insert mode simple calculation
imap <silent> <S-CR> <C-R>=string(eval(input("Calculate: ")))<CR>
"}}}

"Latex words count"{{{
"nmap <silent> <leader>lwc :w<CR> :!detex % \| wc -w<CR>
"}}}

"vim hex file editing"{{{
"nmap <silent> <leader>xxd :%!xxd <CR>
"nmap <silent> <leader>xxr :%!xxd -r <CR>"}}}

"Language Tool for grammar checking"{{{
"set language standalone jar program location
"let g:languagetool_jar=$VIM. '\LanguageTool-2.7\languagetool-commandline.jar'
"let g:languagetool_lang='en-US'
"}}}

"Pydiction setup"{{{
let g:pydiction_location = '$VIM/vimfiles/bundle/pydiction/complete-dict'"}}}

" Syntastic setup--Syntax checking"{{{
" Syntastic depedencies is minimal, most of major version of vim supported
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"disable all stylish message< indent, etc>
let g:syntastic_quiet_messages = { "type": "style"  }

"If you want to enable a language syntax checker, do as follows:
"let g:syntastic_<lang>_checkers=["<lang_checker"]
"The <lang_checker> has to be one in /vimfiles/syntastic/syntax_checkers

"type let g:syntastic_debug=1 and :mes to debug syntax checker
"SyntasticInfo for extra information
"if shell return 1, means execute checker is not successful

"enable python checker
"flake8 contains pyflakes and pep8 and Ned Batchelder's McCabe script
"pep8 is a python style check
"Use <pip install flake8> to install flake8
let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_checkers=['pyflakes']

"enable c checker
"let g:syntastic_c_checkers=['gcc']

"enbale cpp checker
"let g:syntastic_cpp_checkers=['gcc']

"setting about c and cpp checker, please make sure that gcc and g++ is 
"avaible in you $PATH, because syntastic call these executable to generate
"the errors list
"let g:syntastic_c_compiler="gcc"
"let g:syntastic_cpp_compiler="gcc"
"this is for c++ 11, make sure that these options could work in your system
"let g:syntastic_cpp_compiler_options=" -std=c++11"
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open=0
"let g:syntastic_check_on_wq=0 "}}}

"YCM Setup-----------------------------------------------------"{{{
"let g:ycm_global_ycm_extra_conf='$VIM\vimfiles\bundle\youcompleteme-win7-gvim\python\.ycm_extra_conf.py'
""允许 vim 加载 .ycm_extra_conf.py 文件，不再提示  
"let g:ycm_confirm_extra_conf=0  
"" 设置转到定义处的快捷键为Ctrl+]，跟ctagst跳转相同
"nmap <C-]> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 
"" 补全功能在注释中同样有效 
"let g:ycm_complete_in_comments=1  
"" 开启标签补全
"let g:ycm_collect_identifiers_from_tags_files = 1
"" 从第几个键入字符就开始罗列匹配项 
"let g:ycm_min_num_of_chars_for_completion=2
""离开插入模式后自动关闭预览窗口
""autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"" 禁止缓存匹配项，每次都重新生成匹配项  
"let g:ycm_cache_omnifunc=0  
"" 语法关键字补全              
"let g:ycm_seed_identifiers_with_syntax=1  
"" 修改对C函数的补全快捷键，默认是CTRL + space，修改为CTRL+N  
"let g:ycm_key_invoke_completion = '<C-N>'  
""回车即选中当前项;
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>""}}}

"Neocomplete Setup--------------------------------------"{{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable auto complete
"let g:neocomplete#disable_auto_complete = 1
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 2
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }

" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
    "let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'"}}}

"CtrlP setting------------------------------------------------------------------------------"{{{
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>br :CtrlPMRU<cr>"}}}

"Vim-airlines settings---------------------------------------------------------"{{{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

"Diable the *trailing warnings showed at status bar
let g:airline#extensions#whitespace#enabled=0
"let g:airline_detect_whitespace=0


" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'"}}}

"netrw settings----------------------------------------------------------------"{{{
"tree style
let g:netrw_liststyle = 3
let g:netrw_list_hide='.*\.swp$'"}}}

"minibufexpl setup--deprecated----------------------------------------------{{{
"let g:miniBufExplMaxHeight=2
"}}}
" NERDtree----deprecated----------------------------------------------------------------{{{
"" NERDtree的键盘启动F10快捷键
"nnoremap <F10> :NERDTreeToggle<CR> 
"let NERDTreeMouseMode=2
"}}}
"taglist--deprecated----------------------------------------------------------{{{
"taglist插件的map <F9>键启动
"nnoremap <F9> :TlistToggle<CR>
"自动跳转到taglist windows
"nnoremap <leader>tl :TlistOpen<CR>
"let Tlist_GainFocus_On_ToggleOpen=1 "打开是自动聚焦到taglist windows
"let Tlist_Auto_Highlight_Tag = 1
"let Tlist_Auto_Open = 0  "打开文件是是否自动打开taglist windows
"let Tlist_Auto_Update = 1 "文件更改是是否自动更新taglist
"let Tlist_Close_On_Select = 0 "跳转到某个tag是是否自动关闭taglist
"let Tlist_Compact_Format = 0
"let Tlist_Display_Prototype = 0
"let Tlist_Display_Tag_Scope = 1
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Exit_OnlyWindow = 1 "当只有taglist windows被打开是自动退出
"let Tlist_File_Fold_Auto_Close = 0
"let Tlist_Hightlight_Tag_On_BufEnter = 1
"let Tlist_Inc_Winwidth = 0
"let Tlist_Max_Submenu_Items = 1
"let Tlist_Max_Tag_Length = 30
"let Tlist_Process_File_Always = 0
"let Tlist_Show_Menu = 0
"let Tlist_Show_One_File = 0
"let Tlist_Sort_Type = "order"
"let Tlist_Use_Horiz_Window = 0
"let Tlist_Use_Right_Window = 1
"let Tlist_WinWidth = 40
"let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function' 
"}}}

"UltiSnips Configuration"{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical""}}}

"Jedi-vim configuration"{{{
"See https://github.com/davidhalter/jedi-vim
"Completion <C-Space>
"Goto assignments <leader>g (typical goto function)
"Goto definitions <leader>d (follow identifier as far as possible,
"includes imports and statements)
"Show Documentation/Pydoc K (shows a popup with assignments)
"Renaming <leader>r
"Usages <leader>n (shows all the usages of a name)
"Open module, e.g. :Pyimport os (opens the os
"module)"}}}
                            
