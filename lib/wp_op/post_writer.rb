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

  end

  def verify_directory
    FileUtils.mkdir_p @directory
  end
end
