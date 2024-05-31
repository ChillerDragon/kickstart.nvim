function chiller_snippets(luasnip)
      luasnip.add_snippets("eruby", {
        luasnip.snippet("pe", {
          luasnip.text_node("<%= "),
          luasnip.insert_node(1),
          luasnip.text_node(" %>")
        }),
        luasnip.snippet("er", {
          luasnip.text_node("<% "),
          luasnip.insert_node(1),
          luasnip.text_node(" %>")
        })
      })
end
