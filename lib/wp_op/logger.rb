require "wp_op/colors"

class Logger

 include Colors

 def warn message
    puts magenta message
 end


 def error message
   puts red message
 end

 def notify message
   puts green message
 end

 def log message
  puts message
 end

end
