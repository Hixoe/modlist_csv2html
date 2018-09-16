###############################
# Modlist HTML page Generator #
###############################

require "CSV"
require "URI"

$t = " " * 4

rows = []
CSV.foreach("modlist.csv", {:col_sep => "|"}) do |row| # delimited by pipes "|"
	url = row[2]
	if url =~ /\A#{URI::ABS_URI}\z/ # don't create link if the url is invalid
		newRow = "#{$t*3}<tr>\n#{$t*4}<td><a href=\"#{row[2]}\">#{row[0]}</a></td>\n#{$t*4}<td>#{row[1]}</td>\n#{$t*4}<td>#{row[3]}</td>\n#{$t*3}</tr>\n"
	else
		newRow = "#{$t*3}<tr>\n#{$t*4}<td>#{row[0]}</td>\n#{$t*4}<td>#{row[1]}</td>\n#{$t*4}<td>#{row[3]}</td>\n#{$t*3}</tr>\n"
	end
	rows << newRow
end
puts "Generated modlist"

prefix = "<!DOCTYPE html>\n<html>\n#{$t*1}<head>\n#{$t*2}<meta charset=\"utf-8\"/>\n#{$t*2}<title>Modlist</title>\n#{$t*2}<link href=\"https://fonts.googleapis.com/css?family=PT+Mono\" rel=\"stylesheet\">\n#{$t*2}<style type=\"text/css\">\n#{$t*3}table {\n#{$t*4}font-family: 'PT Mono', monospace;\n#{$t*4}max-width: 50%;\n#{$t*4}margin: auto;\n#{$t*3}}\n#{$t*3}td {\n#{$t*4}padding-left: 1ch;\n#{$t*4}padding-right: 1ch;\n#{$t*4}padding-bottom: 0.5ch;\n#{$t*3}}\n#{$t*3}a { text-decoration: none; }\n#{$t*2}</style>\n#{$t*1}</head>\n\n#{$t*1}<body>\n#{$t*2}<table>\n"

suffix = "#{$t*2}</table>\n#{$t*1}</body>\n</html>\n"

File.open("modlist.html", "w") { |io| io.write(prefix) }
File.open("modlist.html", "a") { |io| io.write(rows.join) }
File.open("modlist.html", "a") { |io| io.write(suffix) }

puts "Finished."
