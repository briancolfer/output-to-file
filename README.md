output-to-file
====================================

**Author**:			Alex Khatilov

**Latest Version**:		1.0.3

**Release Date**:		August 9th 2012      

Synopsis
--------

Output of the any script execution will go into the text or html files

## Installing

To install output-to-file, use the following command:

    $ gem install output-to-file


## Usage

	$ output-to-file --help
	
## Template

	# ========================================================================
	# require 'output-to-file/html'
	require 'output-to-file'
	# ========================================================================
	# Timestamp is appended to the file name (YYYYMMDD-HHMMSS)
	$script 		=	__FILE__
	# ========================================================================
	# Mac example of providing the path to the output file:
	# $script_path	=	"/Users/#{ENV['USER']}/Desktop/"
	# ========================================================================
	# Windows example of providing the path to the output file:
	# $script_path	=	"C:\\QA\\" # Make sure the folder you are specifying is exist!
	# ========================================================================
	# Or output file will be created in the same folder with the script
	$script_path	=	""
	# ========================================================================
	$description 	=	"This is a description of the script"
	$name 			=	"Your Name"
	$email 			=	"your@email.com"
	# ========================================================================
	header

	# Start Benchmark [optional]
	benchmark do

	# Script starts here -----------------------------------------------------

		a = 10
		b = 3

		$r.print "Is 'a' (10) in a range (from 1 to 5)? - ", (1 .. 5) === a
		$r.puts ""
		$r.print "Is 'b' (3) in a range (from 1 to 5)? - ", (1 .. 5) === b

	# Script ends here -------------------------------------------------------

	# End Benchmark [optional]
	end
	footer

	# Printing the result in console [optional]
	std_output


## Copyright

&copy; 2012 by [Alex Khatilov](mailto:alex@alex.cc)
