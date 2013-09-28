require 'nokogiri'

class AttachmentBuilder

  def self.from_item item
    d = Attachment.new
    d.url = item.at_css('attachment_url').text
    d
  end

end
