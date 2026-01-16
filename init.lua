-- =============================================================================
-- 1. NÚCLEO Y CARGA INICIAL
-- =============================================================================
require('options')      -- Opciones básicas de Vim 
require('keybindings')  -- Atajos de teclado GLOBALES (donde estará el TTS)
require('plugins')      -- Gestor de paquetes (lazy.vim en este caso)

-- =============================================================================
-- 2. BLOQUE CONDICIONAL (Solo carga si NO es VS Code)
-- =============================================================================
if not vim.g.vscode then

    -- A. INTELIGENCIA ARTIFICIAL
    require('avante-config')  -- Cargar temprano (dependencia de snacks) Asistente de IA avanzado integrado
    require('copilot-config') -- Sugerencias de código en tiempo real 
    require('mcphub-config')  -- Model Context Protocol -> estándar para que las IAS entiendan el contexto de tu proyecto

    -- B. APARIENCIA Y TEMA
    require('vscode-theme')         -- Cargar tema primero para evitar flashes
    require('lualine-config')       -- Barra de estado inferior (INSERT, MODIFY)
    require('render-markdown-config') 
    -- Plugins visuales desactivados (Ruido para accesibilidad):
    --require('blankline-config')
    --require('bufferline-config')
    --require('noice-config')
    --require('mini-config')

    -- C. CEREBRO DEL CÓDIGO (LSP, Análisis y Lenguajes)
    require('lsp')                  -- Servidores de lenguaje (Java, Python, Lua) -> Autocompletado + Detección errores
    require('null-ls-config')       -- Formateadores extra
    require('nvim-lint-config')     -- Linters extra para marcar errores
    require('trouble-config')       -- Gestión de errores
    require('aerial')               -- Esquema de código -> Lista de funciones, clases y variables del archivo actual
    require('cmake-config')         -- Herramientas C/C++
    --require('splitjoin-config')   -- (Desactivado por error de carga)

    -- D. NAVEGACIÓN Y ARCHIVOS
    require('telescope-config')     -- Buscador de archivos por nombre o texto ¡¡¡FLOTANTE!!!
    require('oil-config')           -- Gestor de archivos accesible
    require('fasterbigfile-config') -- Optimización para archivos grandes

    -- E. GIT Y CONECTIVIDAD
    require('octo-config')          -- GitHub
    require("gitsigns-config")      -- Indicadores Git
    require('urlview-config')       -- Enlaces

    -- F. HERRAMIENTAS DE DESARROLLO Y VARIOS
    require('dap-config')           -- Debugger
    require('terminal-config')      -- Terminal integrada
    require('devcontainer-config')  -- Docker DevContainers
    require('live-preview-config')  -- Vista previa HTML/MD
    require('orphans-config')       -- Limpieza de paquetes

end

-- =============================================================================
-- 3. UTILIDADES GLOBALES (Funcionan siempre)
-- =============================================================================
require('dial-config')      -- Mejora incremento de números
require('leap-config')      -- Movimiento rápido
require('surround-config')  -- Manipulación de paréntesis