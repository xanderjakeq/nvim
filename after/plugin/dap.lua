local ok, dap = pcall(require, "dap")
if not ok then return end

--local ok_mason, mason_registry = pcall(require, "mason-registry")
--if not ok_mason then return end
--
--local codelldb = mason_registry.get_package("codelldb")
--local extension_path = codelldb:get_install_path() .. "/extension/"

-- mason-registry fails somehow so just hardcoded it instead... not the best
local codelldb = "/home/xanderjakeq/.local/share/nvim/mason/packages/codelldb"
local extension_path = codelldb .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"


dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = codelldb_path,
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.adapters.godot = {
    type = "server",
    host = '127.0.0.1',
    port = 6006,
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  }
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

print("the dap", dap.configurations.rust)

-- dap.configurations.rust = dap.configurations.cpp
