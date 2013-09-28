require 'fileutils'

class PostWriter

  def initialize( logger )
    @logger = logger
  end

  def write_files(posts, directory)
    validate_directory directory
    verify_directory
    posts.each do |post|
      write_post post
    end
  end

  def validate_directory directory
    directory += "/" unless directory[directory.length - 1] == "/"
    @directory = directory
  end

  def write_post post
    name = post.to_file_name + ".markdown"
    name = @directory + name
    @logger.notify "Writing post '#{name}'"
    File.open(name, 'w') {|f| f.write create_file_contents_for(post) }
  end

  def create_file_contents_for post
    content = create_meta post
    content += post.content
    content
  end

  def create_meta post
    m = "---\n"
    m += "layout: post\n"
    m += "title: \"#{post.title}\"\n"
    m += "date: #{post.pub_date_time}\n"
    m += "published: #{post.published}\n"
    m += "footer: true\n"
    m += "comments: false\n"
    m += "categories: #{create_categories(post)}\n"
    m += "---\n\n"
    m
  end

  def create_categories post
    cats = ""
    return cats if post.categories.length == 0
    if post.categories.length < 2
      cats = post.categories.first
    else
      cats = "["
      post.categories.each_with_index do |c, i|
        if i != 0
          cats += ", "
        end
        cats += "#{c}"
      end
      cats += "]"
    end
    cats
  end

  def verify_directory
    FileUtils.mkdir_p @directory
  end
end
