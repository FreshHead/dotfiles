return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local extras = require 'luasnip.extras'
    local rep = extras.rep

    ls.add_snippets('all', {

      s({ trig = 'SI', name = 'Interface of a Service' }, {
        t "import { InjectionKey } from 'vue';",
        t { '', '', 'export interface I' },
        i(1),
        t { ' {', '' },
        i(0),
        t { '', '}' },
        t { '', '', 'export const I' },
        rep(1),
        t 'Key: InjectionKey<I',
        rep(1),
        t "> = Symbol('I",
        rep(1),
        t "');",
      }),

      s({ trig = 'SC', name = 'Service class' }, {
        t "import { injectable } from 'inversify';",
        t { '', '', '@injectable()' },
        t { '', 'export default class ' },
        i(1),
        t ' implements I',
        rep(1),
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
        t { '', '', "<style lang='scss'>", '', '' },
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
