-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl
local theme = lush(function(injected_functions)
    local sym = injected_functions.sym

    -- Inspired by the color palette found here:
    -- https://lospec.com/palette-list/curiosities
    local colors = {
        white = hsl(0, 0, 100),
        bg = hsl(248, 17, 18),
        fg = hsl(40, 100, 90),
        comment = hsl(195, 73, 37),
        type = hsl(40, 100, 90),
        const = hsl(8, 100, 81),
        op = hsl(172, 100, 42),
        kw = hsl(356, 100, 70),

        error = hsl(329,45,60);
        warn = hsl(40,100,75);
    }

    return {
        -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
        -- groups, mostly used for styling UI elements.
        -- An empty definition `{}` will clear all styling, leaving elements looking
        -- like the 'Normal' group.
        -- To be able to link to a group, it must already be defined.
        --
        -- See :h highlight-groups
        --
        Normal         { bg = colors.bg, fg = colors.fg }, -- Normal text
        Visual         { bg = colors.const.da(10), fg = colors.white }, -- Visual mode selection
        -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
        Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor         { bg = colors.kw, fg = colors.white }, -- Character under the cursor
        CurSearch      { bg = colors.op.da(10), fg = colors.white }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
        lCursor        { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        CursorIM       { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
        CursorLine     { bg = colors.bg.li(5) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        CursorColumn   { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        ColorColumn    { CursorLine }, -- Columns set with 'colorcolumn'
        Directory      { fg = colors.const }, -- Directory names (and other special names in listings)
        DiffAdd        { bg = colors.bg.li(10) }, -- Diff mode: Added line |diff.txt|
        DiffChange     { bg = colors.comment.da(30), fg = colors.white }, -- Diff mode: Changed line |diff.txt|
        DiffDelete     { bg = colors.bg.da(10) }, -- Diff mode: Deleted line |diff.txt|
        DiffText       { bg = colors.comment.li(5), fg = colors.white }, -- Diff mode: Changed text within a changed line |diff.txt|
        -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        TermCursor     { Cursor }, -- Cursor in a focused terminal
        -- TermCursorNC   { }, -- Cursor in an unfocused terminal
        ErrorMsg       { bg = colors.error }, -- Error messages on the command line
        -- VertSplit      { }, -- Column separating vertically split windows
        Folded         { bg = colors.bg.li(6), fg = colors.comment, gui = "italic" }, -- Line used for closed folds
        FoldColumn     { Folded, gui = "normal" }, -- 'foldcolumn'
        -- SignColumn     {}, -- Column where |signs| are displayed
        -- IncSearch      { CurSearch }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute     { CurSearch }, -- |:substitute| replacement text highlighting
        LineNr         { fg = colors.comment }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        -- LineNrAbove    { LineNr }, -- Line number for when the 'relativenumber' option is set, above the cursor line
        -- LineNrBelow    { LineNr }, -- Line number for when the 'relativenumber' option is set, below the cursor line
        -- CursorLineNr   { CursorLine }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
        -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen     { fg = colors.white }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg        { fg = colors.const }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea        { }, -- Area for messages and cmdline
        -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg        { fg = colors.const }, -- |more-prompt|
        NonText        { fg = colors.bg.li(10) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        NormalFloat    { bg = colors.bg.li(5), fg = colors.fg }, -- Normal text in floating windows.
        -- floatborder    { }, -- border of floating windows.
        FloatTitle     { fg = colors.const }, -- Title of floating windows.
        -- NormalNC       { }, -- normal text in non-current windows
        Pmenu          { NormalFloat }, -- Popup menu: Normal item.
        PmenuSel       { Visual }, -- Popup menu: Selected item.
        -- PmenuKind      { }, -- Popup menu: Normal item "kind"
        -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
        -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
        -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
        PmenuSbar      { bg = colors.comment.da(30) }, -- Popup menu: Scrollbar.
        PmenuThumb     { bg = colors.comment }, -- Popup menu: Thumb of the scrollbar.
        Question       { fg = colors.const }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search         { Visual }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        SpecialKey     { fg = colors.const }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad       { sp = colors.error }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap       { sp = colors.warn }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal     { sp = colors.const }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare      { SpellLocal }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine     { bg = colors.bg.da(20), fg = colors.fg }, -- Status line of current window
        StatusLineNC   { bg = colors.bg.da(20), fg = colors.comment }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine        { bg = colors.bg.da(20), LineNr }, -- Tab pages line, not active tab page label
        -- TabLineFill    { TabLine }, -- Tab pages line, where there are no labels
        -- TabLineSel     { fg = colors.light_gray }, -- Tab pages line, active tab page label
        Title          { fg = colors.white }, -- Titles for output from ":set all", ":autocmd" etc.
        WarningMsg     { fg = colors.warn }, -- Warning messages
        -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        -- WildMenu       { CurSearch }, -- Current match in 'wildmenu' completion
        -- WinBar         { }, -- Window bar of current window
        -- WinBarNC       { }, -- Window bar of not-current windows

        -- Common vim syntax groups used for all kinds of code and markup.
        -- Commented-out groups should chain up to their preferred (*) group
        -- by default.
        --
        -- See :h group-name
        --
        -- Uncomment and edit if you want more specific syntax highlighting.

        Comment        { fg = colors.comment, gui = "italic" }, -- Any comment

        Constant       { fg = colors.const }, -- (*) Any constant
        String         { Constant }, --   A string constant: "this is a string"
        -- Character      { fg = colors.light_cyan }, --   A character constant: 'c', '\n'
        -- Number         { Character }, --   A number constant: 234, 0xff
        -- Boolean        { Character }, --   A boolean constant: TRUE, false
        -- Float          { Character }, --   A floating point constant: 2.3e10
        --
        Identifier     { fg = colors.fg, }, -- (*) Any variable name
        Function       { Identifier }, --   Function name (also: methods for classes)

        Statement      { fg = colors.fg }, -- (*) Any statement
        Keyword        { fg = colors.kw }, --   any other keyword
        Conditional    { Keyword }, --   if, then, else, endif, switch, etc.
        Repeat         { Keyword }, --   for, do, while, etc.
        Label          { Keyword }, --   case, default, etc.
        Operator       { fg = colors.op }, --   "sizeof", "+", "*", etc.
        -- Exception      { }, --   try, catch, throw

        -- PreProc        { fg = colors.light_gray }, -- (*) Generic Preprocessor
        -- Include        { }, --   Preprocessor #include
        -- Define         { }, --   Preprocessor #define
        -- Macro          { }, --   Same as Define
        -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

        Type           { fg = colors.type }, -- (*) int, long, char, etc.
        -- StorageClass   { }, --   static, register, volatile, etc.
        -- Structure      { }, --   struct, union, enum, etc.
        -- Typedef        { }, --   A typedef

        Special        { Constant }, -- (*) Any special symbol
        -- SpecialChar    { }, --   Special character in a constant
        Tag            { fg = colors.const }, --   You can use CTRL-] on this
        Delimiter      { fg = colors.op }, --   Character that needs attention
        -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
        -- Debug          { }, --   Debugging statements

        Underlined     { fg = colors.const, gui = "underline" }, -- Text that stands out, HTML links
        -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error          { ErrorMsg }, -- Any erroneous construct
        -- Todo           { bg = colors.dark_green }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- These groups are for the native LSP client and diagnostic system. Some
        -- other LSP clients may use these groups, or use their own. Consult your
        -- LSP client's documentation.

        -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- LspReferenceText            { } , -- Used for highlighting "text" references
        -- LspReferenceRead            { } , -- Used for highlighting "read" references
        -- LspReferenceWrite           { } , -- Used for highlighting "write" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        DiagnosticError            { fg = colors.error } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticWarn             { fg = colors.warn } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticInfo             { fg = colors.comment } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticHint             { fg = colors.comment } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticOk               { fg = colors.const } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
        -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
        -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
        -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
        -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
        DiagnosticUnderlineError   { sp = colors.error, gui = "undercurl" } , -- Used to underline "Error" diagnostics.
        DiagnosticUnderlineWarn    { sp = colors.warn, gui = "undercurl" } , -- Used to underline "Warn" diagnostics.
        DiagnosticUnderlineInfo    { sp = colors.comment, gui = "undercurl" } , -- Used to underline "Info" diagnostics.
        DiagnosticUnderlineHint    { sp = colors.comment, gui = "undercurl" } , -- Used to underline "Hint" diagnostics.
        DiagnosticUnderlineOk      { sp = colors.const, gui = "undercurl" } , -- Used to underline "Ok" diagnostics.
        -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
        -- DiagnosticSignError        { DiagnosticError, bg = SignColumn.bg } , -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn         { DiagnosticWarn, bg = SignColumn.bg } , -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo         { DiagnosticInfo, bg = SignColumn.bg } , -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint         { DiagnosticHint, bg = SignColumn.bg } , -- Used for "Hint" signs in sign column.
        -- DiagnosticSignOk           { DiagnosticOk, bg = SignColumn.bg } , -- Used for "Ok" signs in sign column.

        -- Tree-Sitter syntax groups.
        --
        -- See :h treesitter-highlight-groups, some groups may not be listed,
        -- submit a PR fix to lush-template!
        --
        -- Tree-Sitter groups are defined with an "@" symbol, which must be
        -- specially handled to be valid lua code, we do this via the special
        -- sym function. The following are all valid ways to call the sym function,
        -- for more details see https://www.lua.org/pil/5.html
        --
        -- sym("@text.literal")
        -- sym('@text.literal')
        -- sym"@text.literal"
        -- sym'@text.literal'
        --
        -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

        -- sym"@text.literal"      { }, -- Comment
        -- sym"@text.reference"    { }, -- Identifier
        -- sym"@text.title"        { }, -- Title
        -- sym"@text.uri"          { }, -- Underlined
        -- sym"@text.underline"    { }, -- Underlined
        -- sym"@text.todo"         { }, -- Todo
        -- sym"@comment"           { }, -- Comment
        -- sym"@punctuation"       { }, -- Delimiter
        -- sym"@constant"          { }, -- Constant
        -- sym"@constant.builtin"  { }, -- Special
        -- sym"@constant.macro"    { }, -- Define
        -- sym"@define"            { }, -- Define
        -- sym"@macro"             { }, -- Macro
        -- sym"@string"            { }, -- String
        -- sym"@string.escape"     { }, -- SpecialChar
        -- sym"@string.special"    { }, -- SpecialChar
        -- sym"@character"         { }, -- Character
        -- sym"@character.special" { }, -- SpecialChar
        -- sym"@number"            { }, -- Number
        -- sym"@boolean"           { }, -- Boolean
        -- sym"@float"             { }, -- Float
        -- sym"@function"          { }, -- Function
        -- sym"@function.builtin"  { }, -- Special
        -- sym"@function.macro"    { }, -- Macro
        -- sym"@parameter"         { }, -- Identifier
        -- sym"@method"            { }, -- Function
        -- sym"@field"             { }, -- Identifier
        -- sym"@property"          { }, -- Identifier
        -- sym"@constructor"       { }, -- Special
        -- sym"@conditional"       { }, -- Conditional
        -- sym"@repeat"            { }, -- Repeat
        -- sym"@label"             { }, -- Label
        -- sym"@operator"          { }, -- Operator
        -- sym"@keyword"           { }, -- Keyword
        -- sym"@exception"         { }, -- Exception
        sym"@variable"          { Identifier }, -- Identifier
        -- sym"@type"              { }, -- Type
        -- sym"@type.definition"   { }, -- Typedef
        -- sym"@storageclass"      { }, -- StorageClass
        -- sym"@structure"         { }, -- Structure
        -- sym"@namespace"         { }, -- Identifier
        -- sym"@include"           { }, -- Include
        -- sym"@preproc"           { }, -- PreProc
        -- sym"@debug"             { }, -- Debug
        -- sym"@tag"               { }, -- Tag
        sym"@tag.attribute" { fg = colors.type },
        sym"@type.qualifier" { Statement },
        sym"@constructor" { Statement },
        sym"@keyword.conditional.ternary" { Operator },
        sym"@markup.link" { Underlined },
        -- This is not a standard highlight. It needs to be defined in a 
        -- custom highlight query for languages that support it, e.g. jsdoc. 
        -- The default maps to Keyword, which doesn't look right in my opinion.
        sym"@comment.tag" { Comment, gui="bold" },
    }
end)
return theme
