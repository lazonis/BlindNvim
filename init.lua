-- =============================================================================
-- 1. NÚCLEO Y CARGA INICIAL
-- =============================================================================
require('options')     -- Opciones básicas de Vim
require('keybindings') -- Atajos de teclado GLOBALES (donde estará el TTS)
require('plugins')     -- Gestor de paquetes (lazy.vim en este caso)

-- =============================================================================
-- 2. BLOQUE CONDICIONAL (Solo carga si NO es VS Code)
-- =============================================================================
if not vim.g.vscode then

    -- A. INTELIGENCIA ARTIFICIAL
    require('avante-config') -- Cargar avante temprano para que snacks esté disponible
    require('copilot-config') -- Sugerencias de código en tiempo real
    require('mcphub-config') -- Model Context Protocol -> estándar para que las IAS entiendan el contexto de tu proyecto

    -- B.1 APARIENCIA Y TEMA
    require('vscode-theme')
    require('lualine-config')
    require('render-markdown-config')

    -- B.2 MUY VISUALES
    require('blankline-config')
    require('bufferline-config')
    --require('noice-config')
    require('mini-config')

    -- C. CEREBRO DEL CÓDIGO (LSP, Análisis y Lenguajes)
    require('lsp')
    require('cmake-config')
    require('null-ls-config')
    require('trouble-config')
    require('nvim-lint-config')
    require('aerial')

    -- D. NAVEGACIÓN Y ARCHIVOS
    require('telescope-config')
    require('oil-config')
    require('fasterbigfile-config')

    -- E. GIT Y CONECTIVIDAD
    require('octo-config')
    require("gitsigns-config")
    require('urlview-config')

    -- F. HERRAMIENTAS DE DESARROLLO Y VARIOS
    require('dap-config')
    require('live-preview-config')
    require('terminal-config')
    require('devcontainer-config')
    require('orphans-config')

    --¿?¿?
    vim.cmd [[colorscheme tokyonight-night]]
end

-- =============================================================================
-- 3. UTILIDADES GLOBALES (Funcionan siempre)
-- =============================================================================
require('dial-config')     -- Mejora incremento de números
require('leap-config')     -- Movimiento rápido
require('surround-config') -- Manipulación de paréntesis
