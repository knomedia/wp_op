require 'nokogiri'

class PostBuilder

  def self.from_item item
    p = Post.new
    p.title = item.at_css('title').text
    p.content = item.at_css('encoded').text
    p.published = (item.at_css('status').text == 'publish')
    p.date = item.at_css('pubDate').text
    p
  end

end
