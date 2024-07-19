return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup({
        current_line_blame = true,
        on_attach = function()
        end
      })

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
      end)

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
      end)

      map('n', '<leader>hd', gitsigns.diffthis)
      map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    end

  },
}
