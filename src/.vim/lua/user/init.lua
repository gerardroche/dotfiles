require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "c",
    "css",
    "javascript",
    "lua",
    "php",
    "python",
    "query",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require'treesitter-context'.setup {
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

require'gitsigns'.setup {
  -- signs = {
  --   add          = { text = '│' },
  --   change       = { text = '│' },
  --   delete       = { text = '_' },
  --   topdelete    = { text = '‾' },
  --   changedelete = { text = '~' },
  --   untracked    = { text = '┆' },
  -- },
  -- signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  -- numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  -- linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  -- word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  -- watch_gitdir = {
  --   follow_files = true
  -- },
  -- attach_to_untracked = true,
  -- current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  -- current_line_blame_opts = {
  --   virt_text = true,
  --   virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
  --   delay = 1000,
  --   ignore_whitespace = false,
  -- },
  -- current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  -- sign_priority = 6,
  -- update_debounce = 100,
  -- status_formatter = nil, -- Use default
  -- max_file_length = 40000, -- Disable if file is longer than this (in lines)
  -- preview_config = {
  --   -- Options passed to nvim_open_win
  --   border = 'single',
  --   style = 'minimal',
  --   relative = 'cursor',
  --   row = 0,
  --   col = 1
  -- },
  -- yadm = {
  --   enable = false
  -- },
}
