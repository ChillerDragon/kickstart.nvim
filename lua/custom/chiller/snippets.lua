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
        }),
        luasnip.snippet("lt", {
          luasnip.text_node("<%= link_to "),
          luasnip.insert_node(1),
          luasnip.text_node(" , "),
          luasnip.insert_node(2),
          luasnip.text_node(" %>")
        }),
        luasnip.snippet("sf", {
          luasnip.text_node("<%= simple_form_for"),
          luasnip.insert_node(1),
          luasnip.text_node(" model do |f| %>"),
          luasnip.text_node({"", ""}),
          luasnip.insert_node(2),
          luasnip.text_node({"", ""}),
          luasnip.text_node({"<% end %>"})
        }),
        luasnip.snippet("ff", {
          luasnip.text_node("<%= form_for"),
          luasnip.insert_node(1),
          luasnip.text_node(" model do |f| %>"),
          luasnip.text_node({"", " # form_for is soft deprecated in rails use form_with model: @model instead"}),
          luasnip.insert_node(2),
          luasnip.text_node({"", ""}),
          luasnip.text_node({"<% end %>"})
        }),
        luasnip.snippet("fw", {
          luasnip.text_node('<%= form_with url: "/search", method: :get do |f| %>'),
          luasnip.text_node({"", ""}),
          luasnip.insert_node(1),
          luasnip.text_node({'', '  <%= form.label :query, "Search for:" %>'}),
          luasnip.text_node({'', '  <%= form.text_field :query %>'}),
          luasnip.text_node({"", '  <%= form.submit "Search" %>'}),
          luasnip.text_node({'', ''}),
          luasnip.text_node({"<% end %>"})
        }),
        luasnip.snippet("fwm", {
          luasnip.text_node('<%= form_with model: @model do |f| %>'),
          luasnip.text_node({"", ""}),
          luasnip.insert_node(1),
          luasnip.text_node({'', '  <%= form.text_field :title %'}),
          luasnip.text_node({'', '  <%= form.text_area :body, size: "60x10" %>'}),
          luasnip.text_node({"", '  <%= form.submit %>'}),
          luasnip.text_node({'', ''}),
          luasnip.text_node({"<% end %>"})
        }),
        luasnip.snippet("end", {
          luasnip.text_node({"<% end %>"})
        }),
        luasnip.snippet("it", {
          luasnip.text_node('<%= image_tag "sample.png", alt: "text" %>')
        })
      })
end
