" Colourscheme for Neovim created to resemble GitHub's syntax highlighting
" Code based on "badwolf", by Steve Losh.

" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "github_mid"

" }}}
" Palette {{{

let s:ghc = {}

" Base foreground and background colours
let s:ghc.foreground = ['adbac7', 16]
let s:ghc.background = ['22272e', 15]

" Simple set of colours sampled directly from GitHub
let s:ghc.sky_blue     = ['6cb6ff', 26]
let s:ghc.orange    = ['f69d50', 98]
let s:ghc.redd    = ['f47067', 160]
let s:ghc.magenta   = ['dcbdfb', 34]
let s:ghc.bright_blue = ['96d0ff', 16]

" This gray is used for the comments only
let s:ghc.gray = ['768390', 244]

" This gray is used for the line numbers only
let s:ghc.cloud = ['565d65', 250]

" This is a even lighter gray for background
let s:ghc.light_gray = ['2d333d', 250]

" Colors used in the diff view
let s:ghc.diff_add_light    = ['E7FFEE', 158]
let s:ghc.diff_add_dark     = ['AEF1BF', 121]
let s:ghc.diff_remove_light = ['FFEEF0', 224]
let s:ghc.diff_remove_dark  = ['FCB9C1', 217]

" Color used when selecting a line
let s:ghc.sun = ['38526d', 230]

" Colors used in different areas trought the UI. As such, those are also used
" for vim UI elements only.
let s:ghc.overcast = ['F1F8FF', 195]
let s:ghc.almost_foreground = ['25292E', 234]
let s:ghc.sky_vivid = ['1269D3', 26]
let s:ghc.approve = ['30A64A', 34]
let s:ghc.orange = ['E16221', 208]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:ghc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:ghc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:ghc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal', 'foreground', 'background')

call s:HL('Folded', 'gray', 'light_gray', 'none')
call s:HL('VertSplit', 'cloud', 'bg', 'none')

call s:HL('CursorLine',   '', 'sun', 'none')
call s:HL('CursorColumn', '', 'light_gray')
call s:HL('ColorColumn',  '', 'light_gray')

call s:HL('TabLine', 'gray', 'cloud', 'none')
call s:HL('TabLineFill', 'gray', 'cloud', 'none')
call s:HL('TabLineSel', 'foreground', 'background', 'none')

call s:HL('MatchParen', 'foreground', 'cloud')

call s:HL('NonText',    'cloud', 'bg')
call s:HL('SpecialKey', 'cloud', 'bg')

call s:HL('Visual',    '',  'sun')
call s:HL('VisualNOS', '',  'sun')

call s:HL('Search',    'foreground', 'approve', 'bold')
call s:HL('IncSearch', 'foreground', 'approve',    'bold')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'foreground', 'background')
call s:HL('StatusLineNC', 'gray', 'background', 'none')

call s:HL('Directory', 'orange', '')

call s:HL('Title', 'sky_blue')

call s:HL('ErrorMsg',   'redd',       'bg', 'bold')
call s:HL('MoreMsg',    'redd',   '',   'bold')
call s:HL('ModeMsg',    'redd', '',   'bold')
call s:HL('Question',   'redd', '',   'bold')
call s:HL('WarningMsg', 'redd',       '',   'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" }}}
" CtrlP {{{
call s:HL('CtrlPMatch', 'foreground', 'redd')
call s:HL('CtrlPNoEntries', 'foreground', '')
call s:HL('CtrlPPrtBase', 'foreground', '')
call s:HL('CtrlPPrtCursor', 'foreground', '')
call s:HL('CtrlPLinePre', 'foreground', '')

" }}}
" Gutter {{{

call s:HL('LineNr', 'cloud', 'background')
call s:HL('CursorLineNr', 'foreground', '')
call s:HL('SignColumn', '', 'background')
call s:HL('FoldColumn', 'cloud', 'background')

" }}}
" Cursor {{{

call s:HL('Cursor',  'background', 'foreground', 'bold')
call s:HL('vCursor', 'background', 'foreground', 'bold')
call s:HL('iCursor', 'background', 'foreground', 'none')

" }}}
" Syntax highlighting {{{

call s:HL('Special'        , 'redd')
call s:HL('Comment'        , 'gray')
call s:HL('String'         , 'bright_blue')
call s:HL('Statement'      , 'redd')
call s:HL('Keyword'        , 'redd')
call s:HL('Conditional'    , 'redd')
call s:HL('Operator'       , 'redd')
call s:HL('Label'          , 'redd')
call s:HL('Repeat'         , 'redd')
call s:HL('Todo'           , 'sky_blue',  'bg')
call s:HL('SpecialComment' , 'sky_blue',  'bg')
call s:HL('Identifier'     , 'redd', '', 'none')
call s:HL('Function'       , 'orange', '', 'none')

" Preprocessor stuff is lime, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc'   , 'redd' , '' , 'none')
call s:HL('Macro'     , 'redd' , '' , 'none')
call s:HL('Define'    , 'redd' , '' , 'none')
call s:HL('PreCondit' , 'redd' , '' , 'none')
call s:HL('Type'      , 'redd' , '' , 'none')

call s:HL('Constant'     , 'sky_blue')
call s:HL('Character'    , 'sky_blue')
call s:HL('Boolean'      , 'sky_blue')
call s:HL('Number'       , 'sky_blue')
call s:HL('Float'        , 'sky_blue')
call s:HL('SpecialChar'  , 'sky_blue')
call s:HL('StorageClass' , 'sky_blue')
call s:HL('Structure'    , 'sky_blue')
call s:HL('Typedef'      , 'sky_blue')
call s:HL('Exception'    , 'redd')

" Misc
call s:HL('Error',  'redd')
call s:HL('Debug',  'redd')
call s:HL('Ignore', 'gray')

" }}}
" Completion Menu {{{

call s:HL('Pmenu'      , 'foreground' , 'light_gray')
call s:HL('PmenuSel'   , 'background' , 'cloud')
call s:HL('PmenuSbar'  , '' , 'light_gray')
call s:HL('PmenuThumb' , '', 'sky_blue')

" }}}
" Diffs {{{

call s:HL('DiffDelete', '', 'diff_remove_light')
call s:HL('DiffAdd',    '',     'diff_add_light')
call s:HL('DiffChange', '',     'diff_add_dark')
" call s:HL('DiffText',   'snow', 'deepergravel', 'bold')

" }}}
" Spelling {{{

 if has("spell")
     call s:HL('SpellCap'   , 'redd' , 'bg' , 'undercurl,bold' , 'redd')
     call s:HL('SpellBad'   , ''     , 'bg' , 'undercurl'      , 'redd')
     call s:HL('SpellLocal' , ''     , ''   , 'undercurl'      , 'redd')
     call s:HL('SpellRare'  , ''     , ''   , 'undercurl'      , 'redd')
 endif

" }}}
" Treesitter {{{

call s:HL('TSFunction' , 'magenta')
call s:HL('TSMethod' , 'magenta')
call s:HL('TSFuncBuiltin' , 'magenta')
call s:HL('TSPunctBracket' , 'foreground')
call s:HL('TSConstBuiltin' , 'sky_blue')
call s:HL('TSOperator' , 'sky_blue')
call s:HL('TSParameter' , 'foreground')
call s:HL('TSProperty' , 'sky_blue')
call s:HL('TSType' , 'foreground')
call s:HL('TSTypeBuiltin' , 'foreground')

