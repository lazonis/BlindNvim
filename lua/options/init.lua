<<<<<<< HEAD
--LÓGICA DE ACCESIBILIDAD--
=======


-- Function to return different values based on the presence of a braille device

>>>>>>> ab691aa0bfc9a22d56d9018772d57de4bc8b9aca
local has_braille = require("check-braille").has_braille_device()
function BlindReturn(if_true, if_false)
  if has_braille then return if_true else return if_false end
end
<<<<<<< HEAD
-- [[ Setting options ]]
-- LÓGICA INTERFAZ Y COMPORTAMIENTO
vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
-- Don't show the dumb matching stuff. 
vim.opt.shortmess:append "c"
vim.g.mapleader = "º"
vim.g.maplocalleader = "º"
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true
-- Command height -> reset command line to line 0
vim.o.ch = 0
-- Desactiva atajos por defecto
vim.g.VM_default_mappings = 0
-- Detección de tipo ed archivo para cargar plugins + reglas indentación
vim.cmd('filetype plugin indent on')
-- ???
vim.o.shortmess = vim.o.shortmess .. 'c'
-- Permite cambiar de archivo sin guardar, manteniendo su buffer en segundo plano
vim.o.hidden = true
-- Muestraa números relativos (10,9...0...9,10)
vim.o.relativenumber= true
--Salto de línea al mover el cursor izq/drch
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
--Altura máxima menú autocompletado -> 10
vim.o.pumheight = 10
--Guarda archivos en formato UTF-8
vim.o.fileencoding = 'utf-8'
--Deja oculta la línea de comandos
vim.o.cmdheight = 0
--Al dividir la pantalla la nueva ventana aparece abajo
vim.o.splitbelow = true

--LÓGICA BLIND_RETURN
-- Si usas braile -> abre pantalla a la izquierda (por qué?) REVISAR
-- Si no usas braile -> abre pantalla flotante a la derecha
vim.o.splitright = BlindReturn(false,true)

-- Activa soporte para una gran variedad de colores
vim.opt.termguicolors = true
--¿?¿? MUESTRA TODO EL TEXTO -> Ámbito global
vim.o.conceallevel = 0
-- Muestra siempre la barra de pestañas arriba
vim.o.showtabline = 2
-- No muestra estado de archivo (INSERT, ETC) abajo del todo, lo hace LUA
vim.o.showmode = false
-- Evita crear archivos de seguridad que terminen en "~"
vim.o.backup = false
-- Evita crear archivos de seguridad que terminen en "~" (?) REVISAR
vim.o.writebackup = false
-- Tiempo de reacción del editor para mostrar errores o git updates
vim.o.updatetime = 300
-- Tiempo de reacción para ejecutar una combinación de teclas
vim.o.timeoutlen = 100
-- Conexión entre portapapeles de NEOVIM con los atajos Ctrl+C/Ctrol+V 
vim.o.clipboard = "unnamedplus"
-- Resaltación de palabras buscadas??? REVISAR
vim.o.hlsearch = false
-- Ignora mayúsculas por defecto
vim.o.ignorecase = true
-- Mantiene siempre 3 líneas de margen al hacer scroll vertical
vim.o.scrolloff = 3
-- Mantiene siempre 5 líneas de margen al hacer scroll horizontal
vim.o.sidescrolloff = 5
-- Activa el ratón en todos los modos (click, scroll, selection)
vim.o.mouse = "a"

-- Si tiene Braile -> Líneas largas se cortan visualmente
-- Si no tiene Braile -> Líneas largas se salen de la pantalla, para no romper estructura
vim.wo.wrap = BlindReturn(true, false)

-- Activa columna de numeros a la izquierda
vim.wo.number = true
-- Resalta la línea donde está el cursor 
vim.o.cursorline = true
-- Muestra siempre la columnaa de signos (donde está error, git, bug, etce)
vim.wo.signcolumn = "yes"

-- Configuración del tabulador
-- Vim.bo -> api que configura opciones de ámbito de búfer y de ventana
=======

-- Key for general shortcuts

vim.g.mapleader = "º"
vim.g.maplocalleader = "º"

-- Enable filetype detection and plugins
vim.cmd('filetype plugin indent on')

-- Mouse and clipboard settings

vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.fileencoding = 'utf-8'

-- Tab and indetation settings

vim.o.expandtab = true
vim.bo.expandtab = true
>>>>>>> ab691aa0bfc9a22d56d9018772d57de4bc8b9aca
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- Al hacer enter la nueva línea mantiene la indentación de la anterior
vim.o.autoindent = true
vim.bo.autoindent = true
<<<<<<< HEAD

--Convierte los tabs en espacios reales (evitar errores de formato)
vim.o.expandtab = true
vim.bo.expandtab = true

=======
vim.o.breakindent = true

-- Color and visual settings
>>>>>>> ab691aa0bfc9a22d56d9018772d57de4bc8b9aca

vim.opt.termguicolors = true
--Usa colores para fondos oscuros
vim.o.background = 'dark'
<<<<<<< HEAD
-- Establece para el archivo activo el nivel 2 -> escnder los caracteres de formato
vim.opt_local.conceallevel = 2

-- Si hay un error márcalo pero no añadas una linea nueva con la explicación
-- Subsistema de diagnóstico -> vim.diagnostic -> modulo nativo neovim que actua como controlador de errores
-- Recibe los datos de LSP y decide qué hacer
vim.diagnostic.config({ virtual_lines = false })


=======
vim.o.cursorline = true
vim.o.conceallevel = 0
vim.opt_local.conceallevel = 2

-- Line numbers settings

vim.wo.number = true
vim.o.relativenumber= true

-- Scroll margins settings

vim.o.scrolloff = 3
vim.o.sidescrolloff = 5

-- Sings column settings

vim.wo.signcolumn = "yes"

-- Line wrap settings

vim.wo.wrap = BlindReturn(true, false)

-- Window split settings

vim.o.splitbelow = true
vim.o.splitright = BlindReturn(false,true)

-- Command line height settings

vim.o.cmdheight = 0
vim.o.ch = 0

-- Tab line settings

vim.o.showtabline = 2

-- Messages and modes settings

vim.o.showmode = false
vim.opt.shortmess:append "c"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- Cursor movement settings when reaching line ends

vim.o.whichwrap = 'b,s,<,>,[,],h,l'

-- Suggestions and completions settings

vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
vim.o.pumheight = 10

-- File handling settings

vim.o.hidden = true
vim.o.undofile = true
vim.o.backup = false
vim.o.writebackup = false

-- Times of refresh settings

vim.o.updatetime = 300
vim.o.timeoutlen = 100

-- Diagnostic settings (LSP)

vim.diagnostic.config({ virtual_lines = false })

-- Theme settings
>>>>>>> ab691aa0bfc9a22d56d9018772d57de4bc8b9aca
-- vim.cmd[[colorscheme tokyonight]]
-- vim.g.tokyonight_style = 'night'
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`

<<<<<<< HEAD
--Creación de grupo de auto-comandos -> Cuando ocurra esto -> haz esto
=======

-- Visual Multi settings (specific plugin setting)

vim.g.VM_default_mappings = 0

-- Autocomplete menu setting 

vim.o.shortmess = vim.o.shortmess .. 'c'


-- Feedback Visual: Higlihght what you copy (Yank Highlight)

>>>>>>> ab691aa0bfc9a22d56d9018772d57de4bc8b9aca
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', { --Creas el evento específico
  callback = function()
    vim.highlight.on_yank() --Función nativa que pinta el fondo del texto seleccionado
  end,
  group = highlight_group,
  pattern = '*', -- Se aplica a todos los tipos de archivos 
})
