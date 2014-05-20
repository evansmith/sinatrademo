require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'
require 'json'
require 'erb'


get '/' do
	line_num = 0
	#cake_string = "<ol>"
	@cakes = []
	File.open("cake.list").readlines.each do |line|
		 #cake_string = cake_string+"<li>   #{line}  </li>"
		 #{}"#{line_num +=1}. #{line}" 
		 @cakes.push("#{line}")

	end
	#@cakes.to_json
	json(@cakes, :encoder => :to_json, :content_type => :js)
	puts @cakes
	
	#cake_string = cake_string + "</ol>"
	erb :index 
	#return @cakes
	#return cake_string
end

