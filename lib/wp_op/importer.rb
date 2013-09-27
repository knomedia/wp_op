class Importer
  attr_accessor :wp_xml
  attr_accessor :output

  def initialize(xml, output = 'source/_posts')
    self.wp_xml = xml
    self.output = output
  end
end
