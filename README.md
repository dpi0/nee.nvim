# nee.nvim

Create new files or unnamed buffers using a simple floating window.

![screenshot](https://github.com/user-attachments/assets/f9d55f5f-45b5-46e7-910a-3505021ed070)

## Installation

### [LazyVim](https://github.com/LazyVim/LazyVim)

```lua
{
  "dpi0/nee.nvim",
  dependencies = { "MunifTanjim/nui.nvim" }, -- Used to create the floating window.
  opts = {
    directory_path = vim.fn.expand("~/notes"),  -- Defaults to CWD, otherwise add your path to save file in.
  },
  keys = {
    {
      "<leader>n",  -- Your keybind.
      function()
        require("nee").new_file()
      end,
      desc = "Create New File",
    },
  },
}
```

## Usage

- Press the keybind (`<leader>n` by default) to trigger the prompt.
- Hit `enter` with no filename and you'll get an unnamed buffer.
- Type some filename and it creates a new buffer with the specified path (but does not save it to disk until you manually save).
- Hit `q` in normal mode to hide window.
