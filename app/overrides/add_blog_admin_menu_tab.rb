Deface::Override.new(virtual_path: "spree/layouts/admin",
                     name: "blog_admin_tabs",
                     insert_bottom: "#main-sidebar",
                     text: "<% if Spree.user_class && can?(:admin, Spree::BlogEntry) %><ul class='nav nav-sidebar'><%= tab 'BLOG', url: spree.admin_blog_entries_path, icon: 'comment' %></ul><% end %>",
                     disabled: false)
