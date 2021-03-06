require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get '/start' do
  params[:line]
  @stations = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end

get '/trip' do
	# for testing, just putting in 3 for now.  how to get index of the start station and end station?
	# @num_stops = "3"

#Jon showed me how to do this

line = metro[params[:line].to_sym]
start_station = params[:start]
start_index = line.find_index(start_station)

end_station = params[:end]
end_index = line.find_index(end_station)

stops = end_index - start_index if end_index > start_index
stops = start_index - end_index if end_index < start_index

@num_stops = stops.to_s

  erb :trip
end