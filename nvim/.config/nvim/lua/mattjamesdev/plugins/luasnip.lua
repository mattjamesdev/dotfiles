return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  config = function()
    local luasnip = require("luasnip")

    local s = luasnip.s -- Snippet creator
    local fmt = require("luasnip.extras.fmt").fmt -- Format node
    local i = luasnip.insert_node -- Insert node
    local rep = require("luasnip.extras").rep

    luasnip.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })

    luasnip.add_snippets("lua", {
      s("req", fmt("local {} = require('{}')", { i(1), rep(1) })),
    })

    luasnip.add_snippets("python", {
      luasnip.parser.parse_snippet("ifmain", 'if __name__ == "__main__":')
    })

    local css_system_fonts = [[body {
      font-family: system-ui, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    }]]
    luasnip.add_snippets("css", {
      luasnip.parser.parse_snippet("sysfonts", css_system_fonts)
    })
  end
}
