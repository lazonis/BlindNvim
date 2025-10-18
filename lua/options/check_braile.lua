-- check_braille.lua
-- Detecta si hay un dispositivo Braille conectado en Linux

local function run_command(cmd)
  local handle = io.popen(cmd)
  if not handle then return "" end
  local result = handle:read("*a")
  handle:close()
  return result or ""
end

local function has_braille_device()
  local found = false
  local details = {}

  -- 1️⃣ Buscar en lsusb
  local lsusb = run_command("lsusb")
  for line in lsusb:gmatch("[^\r\n]+") do
    if line:lower():match("braille") or line:lower():match("handy") or line:lower():match("baum") or line:lower():match("freedom") then
      found = true
      table.insert(details, "USB: " .. line)
    end
  end

  -- 2️⃣ Buscar en bluetoothctl
  local bt = run_command("bluetoothctl devices")
  for line in bt:gmatch("[^\r\n]+") do
    if line:lower():match("braille") then
      found = true
      table.insert(details, "Bluetooth: " .. line)
    end
  end

  -- 3️⃣ Ver si BRLTTY está activo
  local brltty_status = run_command("systemctl is-active brltty 2>/dev/null")
  if brltty_status:match("active") then
    found = true
    table.insert(details, "BRLTTY activo")
  end

  -- 4️⃣ Buscar dispositivos de entrada relacionados
  local input = run_command("cat /proc/bus/input/devices 2>/dev/null")
  for line in input:gmatch("[^\r\n]+") do
    if line:lower():match("braille") then
      found = true
      table.insert(details, "Entrada: " .. line)
    end
  end

  -- Resultado final
  if found then
    print("✅ Dispositivo(s) Braille detectado(s):")
    for _, d in ipairs(details) do print("  - " .. d) end
    return true
  else
    print("❌ No se detectó ningún dispositivo Braille.")
    return false
  end
end
