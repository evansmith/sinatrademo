require 'sinatra'

get '/' do
	line_num = 0
	File.open("cake.list").readlines.each do |line|
		puts "#{line_num +=1} #{line}"
	end
end
