require "output-to-file/version"
require "output-to-file/benchmark"
require "output-to-file/template"
#=================================================================================
def std_output()
	$output_file = File.new($file_name, 'r')  
	$output_file.each 	{
		|i|
	puts i
					}
	$output_file.close()
end
#=================================================================================
def header()
	time_stamp = Time.new.strftime('%Y-%m-%d-%H-%M-%S')

	if RUBY_PLATFORM =~ /32/ then
    $file_name = $script_path + "log_" + $script.chop.chop.chop + "_" + time_stamp + ".txt"
	else
	  script_mac = $script.split("/").to_a.last
    $file_name = $script_path + time_stamp + "_" + script_mac.chop.chop.chop + ".txt"
	end

	# $name = ENV['USER']
	to_file = File.new($file_name, "w+")
	
	to_file.print "======================================================================\n"
	to_file.print "= User \s\s\s\s\s\s\s : #{$name}\n"
	to_file.print "= Email \s\s\s\s\s\s : #{$email}\n"
	to_file.print "= Date  \s\s\s\s\s\s : " + Time.now.to_s[0 .. 18],"\n"
	
		if RUBY_PLATFORM =~ /linux/ then
			to_file.puts "= OS \s\s\s\s\s\s\s\s\s\s: Linux"
		elsif RUBY_PLATFORM =~ /32/ then
			to_file.puts "= OS \s\s\s\s\s\s\s\s\s\s: Windows 7"
		elsif RUBY_PLATFORM =~ /darwin12/ then
			to_file.puts "= OS \s\s\s\s\s\s\s\s\s\s: OS X 10.8 Mountain Lion"
		elsif RUBY_PLATFORM =~ /darwin11/ then
			to_file.puts "= OS \s\s\s\s\s\s\s\s\s\s: Mac OS X 10.7 Lion"
		elsif RUBY_PLATFORM =~ /darwin10/ then
			to_file.puts "= OS \s\s\s\s\s\s\s\s\s\s: Mac OS X 10.6 Snow Leopard"
		else
			to_file.puts "= OS \s\s\s\s\s\s\s\s\s\s: Unknown"
		end
		
	to_file.print "= Ruby version : ", RUBY_VERSION,"\n"
	to_file.print "= Script\s\s\s\s\s\s : #{$script}\n"
	to_file.print "= Description\s : #{$description}\n"
	to_file.print "= Output file\s : #{$file_name}\n"
	to_file.print "======================================================================\n\n"
	to_file.close()

	$r = File.new($file_name, "a+")
	
end
#===================================================================================
def footer()
	$r.print "\n\n======================================================================\n"
	$r.print "= Respond time : #{$t_total} \t\t\t\t\s\s\s\s\s\s v #{Mygem::VERSION}\n"
	$r.close()
end
#====================================================================================
module OutputToFile
  class << self
	def perform
	time_stamp = Time.new.strftime('%M%S')
	$file_tmp = "template_script_" + time_stamp + ".rb"
	$to_template = File.new($file_tmp, "w+")
	$to_template.puts $template
	puts ""	
	puts "Create: #{$file_tmp}"	 
	puts ""	
	puts "To run: ruby #{$file_tmp}"	 
	end
  end
end
#====================================================================================
