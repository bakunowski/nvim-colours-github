" Colourscheme for Neovim created to resemble GitHub's syntax highlighting
" Code based on "badwolf", by Steve Losh.

" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=light

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "github"

" }}}
" Palette {{{

let s:ghc = {}

" Base foreground and background colours
let s:ghc.background = ['24292e', 16]
let s:ghc.foreground = ['ffffff', 15]

" Simple set of colours sampled directly from GitHub
let s:ghc.sky     = ['005cc5', 26]
let s:ghc.plum    = ['6F42C1', 98]
let s:ghc.fire    = ['d73a49', 160]
let s:ghc.grass   = ['22863a', 34]
let s:ghc.strings = ['032f62', 16]

" This gray is used for the comments only
let s:ghc.gray = ['6A737D', 244]

" This gray is used for the line numbers only
let s:ghc.cloud = ['BABBBD', 250]

" This is a even lighter gray for background
let s:ghc.light_gray = ['F5F5F5', 250]

" Colors used in the diff view
let s:ghc.diff_add_light    = ['E7FFEE', 158]
let s:ghc.diff_add_dark     = ['AEF1BF', 121]
let s:ghc.diff_remove_light = ['FFEEF0', 224]
let s:ghc.diff_remove_dark  = ['FCB9C1', 217]

" Color used when selecting a line
let s:ghc.sun = ['FFFBDF', 230]

" Colors used in different areas trought the UI. As such, those are also used
" for vim UI elements only.
let s:ghc.overcast = ['F1F8FF', 195]
let s:ghc.almost_black = ['25292E', 234]
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

call s:HL('Normal', 'background', 'foreground')

call s:HL('Folded', 'gray', 'light_gray', 'none')
call s:HL('VertSplit', 'cloud', 'bg', 'none')

call s:HL('CursorLine',   '', 'sun', 'none')
call s:HL('CursorColumn', '', 'light_gray')
call s:HL('ColorColumn',  '', 'light_gray')

call s:HL('TabLine', 'gray', 'cloud', 'none')
call s:HL('TabLineFill', 'gray', 'cloud', 'none')
call s:HL('TabLineSel', 'background', 'foreground', 'none')

call s:HL('MatchParen', 'background', 'cloud')

call s:HL('NonText',    'cloud', 'bg')
call s:HL('SpecialKey', 'cloud', 'bg')

call s:HL('Visual',    '',  'sun')
call s:HL('VisualNOS', '',  'sun')

call s:HL('Search',    'foreground', 'approve', 'bold')
call s:HL('IncSearch', 'foreground', 'approve',    'bold')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'background', 'foreground')
call s:HL('StatusLineNC', 'gray', 'foreground', 'none')

call s:HL('Directory', 'plum', '')

call s:HL('Title', 'sky')

call s:HL('ErrorMsg',   'fire',       'bg', 'bold')
call s:HL('MoreMsg',    'fire',   '',   'bold')
call s:HL('ModeMsg',    'fire', '',   'bold')
call s:HL('Question',   'fire', '',   'bold')
call s:HL('WarningMsg', 'fire',       '',   'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" }}}
" CtrlP {{{
call s:HL('CtrlPMatch', 'foreground', 'fire')
call s:HL('CtrlPNoEntries', 'foreground', '')
call s:HL('CtrlPPrtBase', 'foreground', '')
call s:HL('CtrlPPrtCursor', 'foreground', '')
call s:HL('CtrlPLinePre', 'foreground', '')

" }}}
" Gutter {{{

call s:HL('LineNr', 'cloud', 'foreground')
call s:HL('CursorLineNr', 'foreground', '')
call s:HL('SignColumn', '', 'foreground')
call s:HL('FoldColumn', 'cloud', 'foreground')

" }}}
" Cursor {{{

call s:HL('Cursor',  'foreground', 'background', 'bold')
call s:HL('vCursor', 'foreground', 'background', 'bold')
call s:HL('iCursor', 'foreground', 'background', 'none')

" }}}
" Syntax highlighting {{{

call s:HL('Special'        , 'fire')
call s:HL('Comment'        , 'gray')
call s:HL('String'         , 'strings')
call s:HL('Statement'      , 'fire')
call s:HL('Keyword'        , 'fire')
call s:HL('Conditional'    , 'fire')
call s:HL('Operator'       , 'fire')
call s:HL('Label'          , 'fire')
call s:HL('Repeat'         , 'fire')
call s:HL('Todo'           , 'grass', 'bg')
call s:HL('SpecialComment' , 'sky',  'bg')
call s:HL('Identifier'     , 'fire', '', 'none')
call s:HL('Function'       , 'plum', '', 'none')

" Preprocessor stuff is lime, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc'   , 'fire' , '' , 'none')
call s:HL('Macro'     , 'fire' , '' , 'none')
call s:HL('Define'    , 'fire' , '' , 'none')
call s:HL('PreCondit' , 'fire' , '' , 'none')
call s:HL('Type'      , 'fire' , '' , 'none')

call s:HL('Constant'     , 'sky')
call s:HL('Character'    , 'sky')
call s:HL('Boolean'      , 'sky')
call s:HL('Number'       , 'sky')
call s:HL('Float'        , 'sky')
call s:HL('SpecialChar'  , 'sky')
call s:HL('StorageClass' , 'sky')
call s:HL('Structure'    , 'sky')
call s:HL('Typedef'      , 'sky')
call s:HL('Exception'    , 'fire')

" Misc
call s:HL('Error',  'fire')
call s:HL('Debug',  'fire')
call s:HL('Ignore', 'gray')

" }}}
" Completion Menu {{{

call s:HL('Pmenu'      , 'background' , 'light_gray')
call s:HL('PmenuSel'   , 'foreground' , 'cloud')
call s:HL('PmenuSbar'  , '' , 'light_gray')
call s:HL('PmenuThumb' , '', 'sky')

" }}}
" Diffs {{{

call s:HL('DiffDelete', '', 'diff_remove_light')
call s:HL('DiffAdd',    '',     'diff_add_light')
call s:HL('DiffChange', '',     'diff_add_dark')
" call s:HL('DiffText',   'snow', 'deepergravel', 'bold')

" }}}
" Spelling {{{

 if has("spell")
     call s:HL('SpellCap'   , 'fire' , 'bg' , 'undercurl,bold' , 'fire')
     call s:HL('SpellBad'   , ''     , 'bg' , 'undercurl'      , 'fire')
     call s:HL('SpellLocal' , ''     , ''   , 'undercurl'      , 'fire')
     call s:HL('SpellRare'  , ''     , ''   , 'undercurl'      , 'fire')
 endif

" }}}
" Treesitter {{{

call s:HL('TSFunction' , 'plum')
call s:HL('TSMethod' , 'plum')
call s:HL('TSField' , 'background')
call s:HL('TSFuncBuiltin' , 'plum')
call s:HL('TSPunctBracket' , 'background')
call s:HL('TSPunctDelimiter' , 'background')
call s:HL('TSConstBuiltin' , 'sky')
call s:HL('TSOperator' , 'sky')
call s:HL('TSParameter' , 'background')
call s:HL('TSProperty' , 'sky')
call s:HL('TSType' , 'background')
call s:HL('TSTypeBuiltin' , 'background')
