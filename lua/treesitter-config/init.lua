-- lua/treesitter-config/init.lua

-- Mover la configuración de diagnósticos LSP a su propio sitio sería ideal, 
-- pero la mantenemos aquí protegida para no romper tu flujo actual.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            min = 'Warning',
        },
        update_in_insert = true,
    }
)

-- 1. PROTECCIÓN CONTRA FALLOS (Vital para arreglar tu error)
-- Intentamos cargar el módulo. Si falla (porque no está instalado), paramos suavemente.
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

-- 2. CONFIGURACIÓN SANEADA
configs.setup({
  -- Lista de lenguajes a instalar
  ensure_installed = { 
    "html", "javascript", "lua", "java", "python", "c", "cpp", "rust", 
    "vim", "vimdoc", "query", "markdown", "markdown_inline" 
  },
  
  sync_install = false,
  auto_install = true,

  -- Indentación y Resaltado (Lo más importante)
  indent = { enable = true },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Selección incremental
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },

  -- Integraciones con otros plugins (Solo si los tienes instalados)
  autotag = { enable = true },
  autopairs = { enable = true },

  -- Textobjects: Mantenemos esto básico. Si borraste el plugin 'nvim-treesitter-textobjects',
  -- deberías borrar este bloque también, pero dejarlo aquí no suele romper el arranque si el padre carga bien.
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  
})