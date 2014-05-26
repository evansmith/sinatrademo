require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'
require 'json'
require 'erb'
require 'data_mapper' 


get '/' do
	erb :index 
end

get '/cakes.json' do
	@cakes = []
	File.open("cake.list").readlines.each do |line|
		 @cakes.push("#{line}")
		 

	end
	
	cakes_json= json(@cakes)
	puts cakes_json
	return cakes_json

end

