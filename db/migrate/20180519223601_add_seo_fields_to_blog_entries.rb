class AddSeoFieldsToBlogEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_blog_entries, :seo_title, :string
    add_column :spree_blog_entries, :seo_description, :string
  end
end
