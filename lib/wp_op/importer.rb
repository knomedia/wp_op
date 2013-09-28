require 'nokogiri'
require 'pry'

class Importer
  attr_accessor :wp_xml

  def initialize( logger )
    @logger = logger
  end

  def parse_wordpress xml
    @posts = []
    @attachments = []
    @wp_xml = Nokogiri::XML( File.open(xml) )
    @wp_xml.remove_namespaces!
    @wp_xml.css('item').each do |item|
      process_item item
    end
    show_posts
    show_attachments
  end

  def process_item item
    if item.at_css('attachment_url')
      @attachments << AttachmentBuilder.from_item(item)
    else
      @posts << PostBuilder.from_item(item)
    end
  end

  def show_posts
    @posts.each do |p|
      @logger.warn "***********************"
      @logger.warn p.title
      @logger.warn "***********************"
      @logger.log p.content[0..60]
      @logger.error( "No content...") if p.content.length == 0
      @logger.warn "     \n"
    end
  end

  def show_attachments
    @attachments.each do |a|
      @logger.warn "***********************"
      @logger.warn a.url
      @logger.warn "***********************\n"
    end
  end

end
