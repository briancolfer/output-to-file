require "output-to-file/version"
require "output-to-file/benchmark"
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
#	time_stamp = Time.new.strftime('%Y-%m-%d_%H%M%S')
	time_stamp = Time.new.strftime('%Y%m%d-%H%M%S')

	if RUBY_PLATFORM =~ /32/ then
    $file_name = $script_path + time_stamp + "_" + $script.chop.chop.chop + ".html"
	else
	  script_mac = $script.split("/").to_a.last
    $file_name = $script_path + time_stamp + "_" + script_mac.chop.chop.chop + ".html"
	end

	# $name = ENV['USER']
	to_file = File.new($file_name, "w+")
	
#= HTML ============================================================================
	to_file.print "<html>\n"
	to_file.print "<head>\n"
	to_file.print "<title>Output of: #{$script}</title>\n"
	to_file.print "</head>\n"
	to_file.print "<body bgcolor='\#D4D0C8' leftmargin='0' rightmargin='0' topmargin='0' bottommargin='0' marginheight='0' marginwidth='0'>\n"
	to_file.print "<table bgcolor='\#FFFFFF' width='100%' border='1' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='\#CCCCCC'>\n<tr style='font-family:Verdana, Tahoma; color:0048B0; font-size:12pt;'>\n<td>\n<pre>\n\n"
#=================================================================================
	to_file.print "User \s\s\s\s\s\s\s : #{$name}\n"
	to_file.print "Email \s\s\s\s\s\s : #{$email}\n"
	to_file.print "Date  \s\s\s\s\s\s : " + Time.now.to_s[0 .. 18],"\n"
	
		if RUBY_PLATFORM =~ /linux/ then
			to_file.puts "OS \s\s\s\s\s\s\s\s\s\s: Linux"
		elsif RUBY_PLATFORM =~ /32/ then
			to_file.puts "OS \s\s\s\s\s\s\s\s\s\s: Windows 7"
		elsif RUBY_PLATFORM =~ /darwin12/ then
			to_file.puts "OS \s\s\s\s\s\s\s\s\s\s: OS X 10.8 Mountain Lion"
		elsif RUBY_PLATFORM =~ /darwin11/ then
			to_file.puts "OS \s\s\s\s\s\s\s\s\s\s: Mac OS X 10.7 Lion"
		elsif RUBY_PLATFORM =~ /darwin10/ then
			to_file.puts "OS \s\s\s\s\s\s\s\s\s\s: Mac OS X 10.6 Snow Leopard"
		else
			to_file.puts "OS \s\s\s\s\s\s\s\s\s\s: Unknown"
		end
		
	to_file.print "Ruby version : ", RUBY_VERSION,"\n"
	to_file.print "Script\s\s\s\s\s\s : #{$script}\n"
	to_file.print "Description\s : #{$description}\n"
	to_file.print "Output file\s : #{$file_name}\n"
	to_file.print "</pre>\n<hr color='\#D4D0C8' />\n<pre>"
	to_file.close()

	$r = File.new($file_name, "a+")
	
end
#===================================================================================
def footer()
	$r.print "</pre>\n<hr color='\#D4D0C8' />\n<pre>"
	$r.print "Respond time : #{$t_total} \t\t\t\t\t v #{Mygem::VERSION}\n"

#= /HTML =============================================================================
	$r.print "</pre>\n</td>\n</tr>\n</table>\n</body>\n</html>\n"
#===================================================================================

	$r.close()
end
#====================================================================================
