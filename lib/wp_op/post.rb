require 'date'

class Post
  attr_accessor :title
  attr_accessor :content
  attr_accessor :date
  attr_accessor :tags
  attr_accessor :published
  attr_accessor :categories

  def initialize
    @categories = []
  end

  def to_file_name
    t = @title.gsub(/\s/, '-').downcase
    "#{pub_date}-#{t}"
  end

  def pub_date
    DateTime.parse(@date).to_date.to_s
  end

  def pub_date_time
    DateTime.parse(@date).strftime("%Y-%m-%e %H:%M")
  end

end
