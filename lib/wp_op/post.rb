require 'pry'

class Post
  attr_accessor :title
  attr_accessor :content
  attr_accessor :date
  attr_accessor :tags
  attr_accessor :published


  def to_file_name
    d = DateTime.parse(@date).to_date.to_s
    t = @title.gsub(/\s/, '-').downcase
    "#{d}-#{t}"
  end

end
