require 'rubygems'
require 'sinatra'
require 'data_mapper' 

#Displays Logs
DataMapper::Logger.new($stdout, :debug)

#In memory Sqlite3 connection:
#Not sure if path is full enough
DataMapper.setup(:default, 'sqlite:://cakesDB.db')

#This is where I created a basic Cake class. 
class Cake
	include DataMapper::Resource

	property :id, Serial
	property :cake, String
end

DataMapper.auto_upgrade


#Thoughts of how to fill cake database
File.open("cake.list").readlines.each do |line|
		 @cake = Cake.create(
		 	:cake => "#{line}"
		 	)

	end

puts @cake