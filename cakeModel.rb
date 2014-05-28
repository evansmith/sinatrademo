require 'rubygems'
require 'sinatra'
require 'data_mapper' 


#Displays Logs
DataMapper::Logger.new($stdout, :debug)

#In memory Sqlite3 connection:

DataMapper.setup(:default, 'sqlite:///Users/evansmith/sinatrademo/cakesDB.db')

#This is where I created a basic Cake class. 
class Cake
	include DataMapper::Resource

	property :id, Serial
	property :cake, String
end

DataMapper.finalize

DataMapper.auto_migrate!



#Thoughts of how to fill cake database

File.open("cake.list").readlines.each do |line|
		 @cake = Cake.create(
		 	:cake => "#{line}"
		 	)

	end

#puts @cake