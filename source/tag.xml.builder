xml.instruct!
xml.rss :version => "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    site_url = "http://astokes.org/"
    xml.title "Adam Stokes - #{tag.capitalize}"
    xml.description "El Stokes."
    xml.link URI.join(site_url, "tags", tag.downcase.tr(" ", "_"), "feed.xml")

    posts.first(5).each do |article|
      xml.item do
        xml.title article.title
        xml.link URI.join(site_url, article.url)
        xml.guid URI.join(site_url, article.url)
        xml.pubDate Time.parse(article.date.to_s).rfc822()
        xml.description article.body
        xml.author "Adam Stokes"
      end
    end
  end
end
