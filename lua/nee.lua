local M = {}

local NuiInput = require("nui.input")

M.config = {
  directory_path = vim.fn.getcwd(), -- Default to current working directory
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

M.new_file = function()
  local input = NuiInput({
    position = "50%",
    size = { width = 40 },
    relative = "editor",
    border = {
      style = "rounded",
      text = { top = "New File Name", top_align = "center" },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    prompt = "> ",
    on_submit = function(value)
      if value == "" then
        vim.cmd("enew")
      else
        local path = M.opts.directory_path .. "/" .. value
        vim.cmd("enew")
        vim.api.nvim_buf_set_name(0, path)
      end
    end,
  })

  input:map("n", "q", function()
    input:unmount()
  end, { noremap = true })

  input:mount()
end

return M
