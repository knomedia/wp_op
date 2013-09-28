require 'nokogiri'
require 'pry'

class Importer
  attr_accessor :wp_xml

  def initialize( logger )
    @logger = logger
  end

  def parse_wordpress xml
    posts = []
    @wp_xml = Nokogiri::XML( File.open(xml) )
    @wp_xml.remove_namespaces!
    @wp_xml.css('item').each do |i|
      post = post_from_node i
      if post
        posts << post
        log_post_read( posts.last )
      end
    end
    #temp_show_posts posts
    posts
  end

  def temp_show_posts posts
    posts.each do |p|
      @logger.warn "***********************"
      @logger.warn p.title
      @logger.warn "***********************"
      @logger.log p.content[0..60]
      @logger.error( "No content...") if p.content.length == 0
      @logger.warn "     \n"
    end
  end

  def post_from_node node
    if node.at_css('attachment_url')
      # This isn't actually a post, make this decision prior to this method!!!!
      @logger.warn "Found attachment_url: #{node.at_css('attachment_url').text}"
      return nil
    else
      p = Post.new
      p.title = node.at_css('title').text
      p.content = node.at_css('encoded').text
      p.published = (node.at_css('status').text == 'draft')
      p.date = node.at_css('pubDate').text
      p
    end
  end

  def log_post_read(post)
    @logger.notify "... Reading #{post.title}"
  end

end
