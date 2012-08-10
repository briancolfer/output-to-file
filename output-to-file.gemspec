# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "./lib/output-to-file/version"

Gem::Specification.new do |s|
  s.name		= 	"output-to-file"
  s.version     	= 	Mygem::VERSION
  s.platform      	= 	Gem::Platform::RUBY
  s.date        	= 	Time.now.strftime('%Y-%m-%d')
  s.summary     	= 	%q{The best way to report the output}
  s.description   	= 	%q{Output of the any script execution will go into the text or html files.}
  s.authors     	=  	["Alex Khatilov"]
  s.email       	=  	["alex@alex.cc"]
  s.homepage    	=  	"https://github.com/khatilov/output-to-file"
  s.default_executable 	= 	%q{output-to-file}
  s.executables 	= 	["output-to-file"]
  
  s.files       	=  	[
  				"example.rb", 
  				"lib/output-to-file.rb", 
  				"lib/output-to-file/html.rb", 
  				"lib/output-to-file/benchmark.rb",
  				"lib/output-to-file/version.rb",
				"lib/output-to-file/template.rb",
  				"bin/output-to-file"
				]
 s.extra_rdoc_files =	[
				"LICENSE.txt",
				"README.rdoc"
				]
end