require 'nokogiri'

class PostBuilder

  def self.from_item item
    p = Post.new
    p.title = item.at_css('title').text
    p.content = item.at_css('encoded').text
    p.published = (item.at_css('status').text == 'publish')
    p.date = item.at_css('post_date').text
    item.css('category').each do |c|
      if c.attributes["domain"].content == "post_tag"
        p.categories << c.attributes["nicename"].content != "uncategorized"
      end
    end
    p
  end

end
