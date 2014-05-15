require 'sinatra'
require 'sinatra/reloader' if development?
require 'erb'

get '/' do
	line_num = 0
	@cake = []
	File.open("cake.list").readlines.each do |line|
		 @cake.push("#{line_num +=1}. #{line}")
		 
	end
	erb :index
end

