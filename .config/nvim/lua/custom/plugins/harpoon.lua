-- local function get_git_branch()
--   local git_branch = vim.fn.systemlist 'git branch --show-current'
--   if git_branch[1] == 'fatal: not a git repository (or any of the parent directories): .git' then
--     return nil
--   end
--   return git_branch[1]
-- end

return {
  {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    commit = 'e76cb03',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('harpoon'):setup {
        settings = {
          save_on_toggle = true,
          key = function()
            local Job = require 'plenary.job'

            local function get_os_command_output(cmd, cwd)
              if type(cmd) ~= 'table' then
                return {}
              end
              local command = table.remove(cmd, 1)
              local stderr = {}
              local stdout, ret = Job:new({
                command = command,
                args = cmd,
                cwd = cwd,
                on_stderr = function(_, data)
                  table.insert(stderr, data)
                end,
              }):sync()
              return stdout, ret, stderr
            end

            -- Use git branch name if available
            local branch = get_os_command_output({
              'git',
              'rev-parse',
              '--abbrev-ref',
              'HEAD',
            })[1]

            if branch then
              return vim.loop.cwd() .. '-' .. branch
            else
              return vim.loop.cwd()
            end
          end, --   local branch = get_git_branch()
          --   if branch == nil then
          --     return vim.loop.cwd()
          --   end
          --   return branch
          -- end,
        },
      }
    end,
    keys = {
      {
        '<leader>a',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'harpoon file',
      },
      {
        '<leader>h',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'harpoon quick menu',
      },
      {
        '<leader>j',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'harpoon to file 1',
      },
      {
        '<leader>k',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'harpoon to file 2',
      },
      {
        '<leader>l',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'harpoon to file 3',
      },
      {
        '<leader>;',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'harpoon to file 4',
      },
      {
        "<leader>'",
        function()
          require('harpoon'):list():select(5)
        end,
        desc = 'harpoon to file 5',
      },
      {
        '<leader>[',
        function()
          require('harpoon'):list():prev()
        end,
        desc = 'harpoon prev buffer',
      },
      {
        '<leader>]',
        function()
          require('harpoon'):list():next()
        end,
        desc = 'harpoon next buffer',
      },
    },
  },
}
