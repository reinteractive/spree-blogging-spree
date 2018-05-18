xml.instruct! :xml, version: "1.0" 
xml.rss do
  xml.channel do
    xml.title "#{Spree::current_store.name} Blog"
    xml.description "#{Spree::current_store.url} Blog"
    xml.link blog_url(@blog)

    @blog_entries.each do |blog_entry|
      xml.item do
        xml.title blog_entry.title
        xml.description blog_entry.entry_summary + blog_full_article_html(blog_entry)
        xml.content blog_entry.body + blog_first_appeared_html(blog_entry), type: :html
        xml.pubDate blog_entry.published_at.to_s(:rfc822)
        xml.link blog_entry_url_permalink(blog_entry)
        xml.guid blog_entry_url_permalink(blog_entry)
        blog_entry.tag_list.each do |tag|
          xml.category tag
        end
      end
    end
  end
end
