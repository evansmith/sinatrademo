require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'
require 'json'
require 'erb'
require 'data_mapper' 

#Displays Logs
DataMapper::Logger.new($stdout, :debug)

#In memory Sqlite3 connection:
#Not sure if path is full enough
DataMapper.setup(:default, 'sqlite:///Users/evansmith/sinatrademo/cakesDB.db')

#This is where I created a basic Cake class. 
class Cake
	include DataMapper::Resource

	property :id, Serial
	property :cake, String
end

DataMapper.finalize

DataMapper.auto_upgrade!


get '/' do
	@cakes = []
	@cakes = Cake.all
	@cakes.each do |line|
		puts line.cake
	end 
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

