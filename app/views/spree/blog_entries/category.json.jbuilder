json.set! :blog_entries do
  json.array!(@blog_entries) do |blog_entry|
    json.title blog_entry.title
    json.author markdown(blog_entry.author)
    json.permalink blog_entry.permalink
    json.visible blog_entry.visible
    json.published_at blog_entry.published_at
    json.summary markdown(blog_entry.summary)
    json.categories blog_entry.category_list
    json.seo_title blog_entry.get_seo_title
    json.seo_description blog_entry.get_seo_description
  end
end

json.set! :meta do
  json.code response.status
end
