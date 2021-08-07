"""""""""""""""""""""""""
" Theme based on https://github.com/folke/tokyonight.nvim which is based on https://marketplace.visualstudio.com/items?itemName=enkia.tokyo-night
" Created because it doesn't work on vim
"""""""""""""""""""""""""

" highlight clear

" if exists("syntax_on")
"     syntax reset
" endif

set t_Co=256
set background=dark

" let g:colors_name="tokyonight"

let s:none                  = { "gui": "NONE"    }
let s:bg_dark               = { "gui": "#1f2335" }
let s:bg                    = { "gui": "#24283b" }
let s:bg_highlight          = { "gui": "#292e42" }
let s:terminal_black        = { "gui": "#414868" }
let s:fg                    = { "gui": "#c0caf5" }
let s:fg_dark               = { "gui": "#a9b1d6" }
let s:fg_gutter             = { "gui": "#3b4261" }
let s:dark3                 = { "gui": "#545c7e" }
let s:comment               = { "gui": "#565f89" }
let s:dark5                 = { "gui": "#737aa2" }
let s:blue0                 = { "gui": "#3d59a1" }
let s:blue                  = { "gui": "#7aa2f7" }
let s:cyan                  = { "gui": "#7dcfff" }
let s:blue1                 = { "gui": "#2ac3de" }
let s:blue2                 = { "gui": "#0db9d7" }
let s:blue5                 = { "gui": "#89ddff" }
let s:blue6                 = { "gui": "#B4F9F8" }
let s:blue7                 = { "gui": "#394b70" }
let s:magenta               = { "gui": "#bb9af7" }
let s:magenta2              = { "gui": "#ff007c" }
let s:purple                = { "gui": "#9d7cd8" }
let s:orange                = { "gui": "#ff9e64" }
let s:yellow                = { "gui": "#e0af68" }
let s:green                 = { "gui": "#9ece6a" }
let s:green1                = { "gui": "#73daca" }
let s:green2                = { "gui": "#41a6b5" }
let s:teal                  = { "gui": "#1abc9c" }
let s:red                   = { "gui": "#f7768e" }
let s:red1                  = { "gui": "#db4b4b" }

let s:black                 = { "gui": "#07080c" }
let s:border_highlight      = { "gui": "#3d59a1" }
let s:border               = s:black

let s:diff_add              = { "gui": "#378d9a" }
let s:diff_delete           = { "gui": "#d02a2a" }
let s:diff_change           = { "gui": "#30405f" }
let s:diff_text             = s:blue7

let s:error                 = s:red1
let s:warning               = s:yellow
let s:info                  = s:blue2
let s:hint                  = s:teal

let s:bg_search             = { "gui": "#3d59a1" }
let s:bg_visual             = { "gui": "#2b3e71" }
let s:fg_sidebar            = s:fg_dark

" Sidebar and Floats are configurable
let s:bg_sidebar            = s:none
let s:bg_float              = s:bg_dark


" Popups and statusline always get a dark background
let s:bg_popup              = s:bg_dark
let s:bg_statusline         = s:bg_dark

let s:pmenu_sel             = { "gui": "#0c0d13" }
let s:pmenu_sbar            = { "gui": "#020203" }

let s:debugbp               = { "gui": "#0db9d7" }

function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
endfunction

" call s:h("", { "": s:bg2 })
call s:h("Comment", { "fg": s:comment, "gui": "italic" })                      " any comment
call s:h("ColorColumn", { "bg": s:black })                                                 " used for the columns set with 'colorcolumn'
call s:h("Conseal", { "fg": s:dark3 })                                                     " placeholder characters substituted for concealed text (see 'conceallevel')
call s:h("Cursor", { "fg": s:bg, "bg": s:fg })                                              " character under the cursor
call s:h("lCursor", { "fg": s:bg, "bg": s:fg })                                             " the character under the cursor when |language-mapping| is used (see 'guicursor')
call s:h("CursorIM", { "fg": s:bg, "bg": s:fg })                                            " like Cursor, but used when in IME mode |CursorIM|
call s:h("CursorColumn", { "bg": s:bg_highlight })                                         " Screen-column at the cursor, when 'cursorcolumn' is set.
call s:h("CursorLine", { "bg": s:bg_highlight })                                           " Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
call s:h("Directory", { "fg": s:blue })                                                    " directory names (and other special names in listings)
call s:h("DiffAdd", { "bg": s:diff_add })                                                  " diff mode: Added line |diff.txt|
call s:h("DiffChange", { "bg": s:diff_change })                                            " diff mode: Changed line |diff.txt|
call s:h("DiffDelete", { "bg": s:diff_delete })                                            " diff mode: Deleted line |diff.txt|
call s:h("DiffText", { "bg": s:diff_text })                                                " diff mode: Changed text within a changed line |diff.txt|
call s:h("EndOfBuffer", { "fg": s:bg })                                                    " filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
call s:h("TermCursor ", { })                                                            " cursor in a focused terminal
call s:h("TermCursorN", { })                                                            " cursor in an unfocused terminal
call s:h("ErrorMsg", { "fg": s:error })                                                    " error messages on the command line
call s:h("VertSplit", { "fg": s:border })                                                  " the column separating vertically split windows
call s:h("Folded", { "fg": s:blue, "bg": s:fg_gutter })                                     " line used for closed folds
call s:h("FoldColumn", { "bg": s:bg, "fg": s:comment })                                     " 'foldcolumn'
call s:h("SignColumn", { "bg": s:none, "fg": s:fg_gutter })  " column where |signs| are displayed
call s:h("SignColumnSB", { "bg": s:bg_sidebar, "fg": s:fg_gutter })                         " column where |signs| are displayed
call s:h("Substitute", { "bg": s:red, "fg": s:black })                                      " |:substitute| replacement text highlighting
call s:h("LineNr", { "fg": s:fg_gutter })                                                  " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("CursorLineNr", { "fg": s:dark5 })                                                " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h("MatchParen", { "fg": s:orange, "gui": "bold" })                                 " The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
call s:h("ModeMsg", { "fg": s:fg_dark, "gui": "bold" })                                   " 'showmode' message (e.g., "-- INSERT -- ")
call s:h("MsgArea", { "fg": s:fg_dark })                                                   " Area for messages and cmdline
call s:h("MsgSeparato", { })                                                            " Separator for rcrolled messages, `msgsep` flag of 'display'
call s:h("MoreMsg", { "fg": s:blue })                                                      " |more-prompt|
call s:h("NonText", { "fg": s:dark3 })                                                     " '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
call s:h("Normal", { "fg": s:fg, "bg": s:none })             " normal text
call s:h("NormalNC", { "fg": s:fg, "bg": s:none })           " normal text in non-current windows
call s:h("NormalSB", { "fg": s:fg_sidebar, "bg": s:bg_sidebar })                            " normal text in non-current windows
call s:h("NormalFloat", { "fg": s:fg, "bg": s:bg_float })                                   " Normal text in floating windows.
call s:h("FloatBorder", { "fg": s:border_highlight })
call s:h("Pmenu", { "bg": s:bg_popup, "fg": s:fg })                                         " Popup menu: normal item.
call s:h("PmenuSel", { "bg": s:pmenu_sel })                              " Popup menu: selected item.
call s:h("PmenuSbar", { "bg": s:pmenu_sbar })                            " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:fg_gutter })                                              " Popup menu: Thumb of the scrollbar.
call s:h("Question", { "fg": s:blue })                                                     " |hit-enter| prompt and yes/no questions
call s:h("QuickFixLine", { "bg": s:bg_visual, "gui": "bold" })                            " Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
call s:h("Search", { "bg": s:bg_search, "fg": s:fg })                                       " Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
call s:h("IncSearch", { "bg": s:orange, "fg": s:black })                                    " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("SpecialKey", { "fg": s:dark3 })                                                  " Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
call s:h("SpellBad", { "sp": s:error, "gui": "undercurl" })                               " Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
call s:h("SpellCap", { "sp": s:warning, "gui": "undercurl" })                             " Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
call s:h("SpellLocal", { "sp": s:info, "gui": "undercurl" })                              " Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
call s:h("SpellRare", { "sp": s:hint, "gui": "undercurl" })                               " Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
call s:h("StatusLine", { "fg": s:fg_sidebar, "bg": s:bg_statusline })                       " status line of current window
call s:h("StatusLineNC", { "fg": s:fg_gutter, "bg": s:bg_statusline })                      " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("TabLine", { "bg": s:bg_statusline, "fg": s:fg_gutter })                           " tab pages line, not active tab page label
call s:h("TabLineFill", { "bg": s:black })                                                 " tab pages line, where there are no labels
call s:h("TabLineSel", { "fg": s:black, "bg": s:blue })                                     " tab pages line, active tab page label
call s:h("Title", { "fg": s:blue, "gui": "bold" })                                        " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "bg": s:bg_visual })                                                  " Visual mode selection
call s:h("VisualNOS", { "bg": s:bg_visual })                                               " Visual mode selection when vim is "Not Owning the Selection".
call s:h("WarningMsg", { "fg": s:warning })                                                " warning messages
call s:h("Whitespace", { "fg": s:fg_gutter })                                              " "nbsp", "space", "tab" and "trail" in 'listchars'
call s:h("WildMenu", { "bg": s:bg_visual })                                                " current match in 'wildmenu' completion

" These groups are not listed as default vim groups,
" but they are defacto standard group names for syntax highlighting.
" commented out groups should chain up to their "preferred" group by
" default,
" Uncomment and edit if you want more specific syntax highlighting.

call s:h("Constant", { "fg": s:orange })                                                   " (preferred) any constant
call s:h("String", { "fg": s:green })                                                      " a string constant: "this is a string"
call s:h("Character", { "fg": s:green })                                                   " a character constant: 'c', '\n'
call s:h("Number", { "fg": s:orange })                                                          "   a number constant: 234, 0xff
call s:h("Boolean", { "fg": s:orange })                                                          "  a boolean constant: TRUE, false
call s:h("Float", { "fg": s:orange })                                                          "    a floating point constant: 2.3e10

call s:h("Identifier", { "fg": s:magenta })                  " (preferred) any variable name
call s:h("Function", { "fg": s:blue })                       " function name (also: methods for classes)

call s:h("Statement", { "fg": s:magenta })                                                 " (preferred) any statement
call s:h("Contitional", { "fg": s:magenta })                                   " if, then, else, endif, switch, etc.
call s:h("Repeat", { "fg": s:magenta })                                        "   for, do, while, etc.
call s:h("Label", { "fg": s:magenta })                                         " case, default, etc.

call s:h("Operator", { "fg": s:blue5 })                                                    " "sizeof", "+", "*", etc.
call s:h("Keyword", { "fg": s:cyan })                         "  any other keyword
call s:h("Exception", { "fg": s:cyan })                                                          "  try, catch, throw

call s:h("PreProc", { "fg": s:cyan })                                                      " (preferred) generic Preprocessor
call s:h("Include", { "fg": s:cyan })                                                          "  preprocessor #include
call s:h("Define", { "fg": s:cyan })                                                          "   preprocessor #define
call s:h("Macro", { "fg": s:cyan })                                                          "    same as Define
call s:h("PreCondit", { "fg": s:cyan })                                                          "  preprocessor #if, #else, #endif, etc.

call s:h("Type", { "fg": s:blue1 })                                                        " (preferred) int, long, char, etc.
call s:h("StorageClass", { "fg": s:blue1 })                                                          " static, register, volatile, etc.
call s:h("Structure", { "fg": s:blue1 })                                                          "  struct, union, enum, etc.
call s:h("Typedef", { "fg": s:blue1 })                                                          "  A typedef

call s:h("Special", { "fg": s:blue1 })                                                     " (preferred) any special symbol
call s:h("SpecialChar", { "fg": s:blue1 })                                                          "  special character in a constant
call s:h("Tag",  { "fg": s:blue1 })                                                          "    you can use CTRL-] on this
call s:h("Delimiter", { "fg": s:blue1 })                                                          "  character that needs attention
call s:h("SpecialComment", { "fg": s:blue1 })                                                          " special things inside a comment
call s:h("Debug", { "fg": s:blue1 })                                                          "    debugging statements

call s:h("Underlined", { "gui": "underline" })                                           " (preferred) text that stands out, HTML links
call s:h("Bold", { "gui": "bold" })
call s:h("Italic", { "gui": "italic" })

" "Ignore", below, may be invisible...)
" Ignore: { },                                                                 " (preferred) left blank, hidden  |hl-Ignore|

call s:h("Error", { "fg": s:error })                                                       " (preferred) any erroneous construct
call s:h("Todo", { "bg": s:yellow, "fg": s:bg })                                            " (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

" call s:h("qfLineNr", { "fg": s:dark5 })
" call s:h("qfFileName", { "fg": s:blue })

" call s:h("htmlH1", { "fg": s:magenta, "gui": "bold" })
" call s:h("htmlH2", { "fg": s:blue, "gui": "bold" })

" " mkdHeading: { "fg" = c.orange, "gui" = "bold" },
" " mkdCode: { "bg" = c.terminal_black, "fg" = c.fg },
" call s:h("mkdCodeDelimiter", { "bg": s:terminal_black, "fg": s:fg })
" call s:h("mkdCodeStart", { "fg": s:teal, "gui": "bold" })
" call s:h("mkdCodeEnd", { "fg": s:teal, "gui": "bold" })
" " mkdLink: { "fg": c.blue, "gui": "underline" },

" call s:h("markdownHeadingDelimiter", { "fg": s:orange, "gui": "bold" })
" call s:h("markdownCode", { "fg": s:teal })
" call s:h("markdownCodeBlock", { "fg": s:teal })
" call s:h("markdownH1", { "fg": s:magenta, "gui": "bold" })
" call s:h("markdownH2", { "fg": s:blue, "gui": "bold" })
" call s:h("markdownLinkText", { "fg": s:blue, "gui": "underline" })

" call s:h("debugPC", { "bg": s:bg_sidebar })                                                " used for highlighting the current line in terminal-debug
" call s:h("debugBreakpoint", { "bg": s:debugbp, "fg": s:info })               " used for breakpoint colors in terminal-debug

