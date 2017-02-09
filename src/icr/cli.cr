require "option_parser"
require "../icr"

# Not 100% sure if we need this just yet
STDIN.sync = true
STDOUT.sync = true

is_debug = false
libs = [] of String

def print_stamp
  puts "Author: #{Icr::AUTHOR}"
  puts "Homepage: #{Icr::HOMEPAGE}"
end

OptionParser.parse! do |parser|
  parser.banner = "Usage: icr [options]"

  parser.on("-v", "--version", "Show version") do
    puts "icr version #{Icr::VERSION}"
    print_stamp
    exit 0
  end

  parser.on("-h", "--help", "Show this help") do
    puts parser
    puts
    print_stamp
    exit 0
  end

  parser.on("-d", "--debug", "Run icr in debug mode") do
    is_debug = true
  end

  parser.on("-r FILE", "--require=FILE", "auto require FILE") do |filename|
    libs.push(%{require "#{filename}"})
  end
end

code = libs.join(";")
Icr::Console.new(is_debug).start(code)
