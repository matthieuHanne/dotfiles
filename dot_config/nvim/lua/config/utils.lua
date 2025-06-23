local M = {}
local uv = vim.uv or vim.loop

-- Shorten path to '.../parent/parent/' style
local function shorten_path(path)
  local parts = {}
  for part in path:gmatch("[^/]+") do
    parts[#parts + 1] = part
  end
  if #parts <= 2 then
    return path .. "/"
  end
  return ".../" .. parts[#parts - 1] .. "/" .. parts[#parts] .. "/"
end

-- Recursively create directories (mkdir -p)
local function mkdir_p(dir)
  if uv.fs_stat(dir) then return true end
  local parent = vim.fn.fnamemodify(dir, ":h")
  if parent ~= dir then mkdir_p(parent) end
  return uv.fs_mkdir(dir, 493) -- 0755
end


-- Create the file with current buffer as starting point
function M.create_file()
  local current_dir = vim.fn.expand("%:p:h")
  local prompt_dir = shorten_path(current_dir)

  vim.ui.input({ prompt = "Create file in " .. prompt_dir .. ": " }, function(input)
    if not input or input == "" then
      print("No file name provided, aborted.")
      return
    end

    local target_path = current_dir .. "/" .. input
    local target_dir = vim.fn.fnamemodify(target_path, ":h")

    mkdir_p(target_dir)

    if vim.fn.filereadable(target_path) == 0 then
      local file = io.open(target_path, "w")
      if file then
        file:close()
        print("Created file: " .. target_path)
      else
        print("Failed to create file: " .. target_path)
        return
      end
    else
      print("File already exists: " .. target_path)
    end

    vim.cmd("edit " .. target_path)
  end)
end

return M
