function chiller_snippets(luasnip)
      luasnip.add_snippets("cpp", {
        luasnip.snippet("rr", {
          luasnip.text_node({'Right("going right");'})
        }),
        luasnip.snippet("ll", {
          luasnip.text_node({'Left("going left");'})
        })
      })
      luasnip.add_snippets("go", {
        luasnip.snippet("package", {
          luasnip.text_node(
            {
              "package main",
              "",
              'import "fmt"',
              "",
              "func main() {",
              "   val := uint32(6666666)",
              '   fmt.Printf("val=%v\\n", val)'
            }
          ),
          luasnip.insert_node(1),
          luasnip.text_node({"", "}"})
        })
      })
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
          luasnip.text_node("'home', "),
          luasnip.insert_node(2),
          luasnip.text_node("root_path %>")
        }),
        luasnip.snippet("ltd", {
          luasnip.text_node("<%= link_to root_path do %>"),
          luasnip.text_node({"", '  <div class="btn">Home</div>'}),
          luasnip.insert_node(1),
          luasnip.text_node({"", ""}),
          luasnip.text_node("<% end %>")
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
        luasnip.snippet("else", {
          luasnip.text_node({"<% else %>"})
        }),
        luasnip.snippet("it", {
          luasnip.text_node('<%= image_tag "sample.png", alt: "text" %>')
        }),
        luasnip.snippet("ts", {
          luasnip.text_node('<%= turbo_stream_from dom_id('),
          luasnip.insert_node(1),
          luasnip.text_node(') %>')
        })
      })
end
