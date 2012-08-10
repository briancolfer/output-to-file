  def read_spec(spec_path)
    raw_spec = ""
		raw_spec = File.open(spec_path) {|f| f.read.encode('UTF-8') }
		raw_spec.gsub!( "\u2229\u2557\u2510","")
  end
  
  read_spec("template.rb")