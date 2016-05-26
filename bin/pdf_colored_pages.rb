#!/usr/bin/env ruby

require 'shellwords'
require 'pdf_colored_pages'


# Exit cleanly from an early interrupt
Signal.trap('INT') { exit 1 }


$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")

if ARGV.length==0
  puts "[USAGE]: #{__FILE__} PATH_TO_PDF"
  exit
end


file = Shellwords.shellescape(ARGV.first)

unless File.exist? file
  puts "[ERROR]: file does not exist\n #{file}"
  exit
end

puts PdfColoredPages.as_range_string(file)