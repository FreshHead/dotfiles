return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require 'luasnip'

    vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local extras = require 'luasnip.extras'
    local l = extras.lambda
    local f = ls.function_node
    local rep = extras.rep

    local get_filename = function()
      local filename = vim.fn.expand '%:t:r'
      return filename:gsub("^%l", string.upper)
    end

    local get_class_without_impl = function()
      local filename = get_filename()
      return filename:sub(1, -5)
    end

    ls.add_snippets('all', {
      s({ trig = 'AC', name = 'Abstract class' }, {
        t { 'export abstract class ' },
        f(get_filename),
        t { ' {', '' },
        t { 'abstract' },
        i(0),
        t { '', '}' },
      }),

      s({ trig = 'ACI', name = 'Service class implementing abstract class' }, {
        t "import { injectable } from 'inversify';",
        t { '', '', '@injectable()' },
        t { '', 'export class ' },
        f(get_filename),
        t ' implements ',
        f(get_class_without_impl),
        rep(1),
        t { ' {', '' },
        i(0),
        t { '', '}' },
      }),


      s({ trig = 'SI', name = 'Interface of a Service' }, {
        t "import { InjectionKey } from 'vue';",
        t { '', '', 'export interface I' },
        f(get_filename),
        -- i(1),
        t { ' {', '' },
        i(0),
        t { '', '}' },
        t { '', '', 'export const I' },
        f(get_filename),
        -- rep(1),
        t 'Key: InjectionKey<I',
        f(get_filename),
        -- rep(1),
        t "> = Symbol('I",
        f(get_filename),
        -- rep(1),
        t "');",
      }),

      s({ trig = 'SCI', name = 'Service class' }, {
        t "import { injectable } from 'inversify';",
        t { '', '', '@injectable()' },
        t { '', 'export class ' },
        f(get_filename),
        -- i(1),
        t ' implements I',
        f(get_filename),
        -- rep(1),
        t { ' {', '' },
        i(0),
        t { '', '}' },
      }),

      s({ trig = 'SFC', name = 'Vue SFC' }, {
        t { '<template>', '' },
        i(0),
        t { '', '</template>' },
        t { '', '', "<script setup lang='ts'>", '', '' },
        t '</script>',
        -- t { '', '', "<style lang='scss'>", '', '' },
        t { '', '', "<style>", '', '' },
        t '</style>',
      }),

      s({ trig = 'store', name = 'store', dscr = 'create a store' }, {
        t "import { defineStore } from 'pinia';",
        t { '', '', 'export const use' },
        i(1),
        t { "Store = defineStore('" },
        rep(1),
        t { "Store', () => {", '' },
        i(0),
        t { '', '', 'return {};' },
        t { '', '});' },
      }),
    })
  end,
}
