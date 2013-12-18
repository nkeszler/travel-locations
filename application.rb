require "sinatra"
require "data_mapper"

require_relative "routes/locations_site"
require_relative "routes/location_page"
require_relative 'routes/users'
require_relative 'routes/sessions'
require_relative 'routes/profile'



env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "sqlite:#{Dir.pwd}/data/travel_location_#{env}")

require './models/location'
require './models/user'
require './models/photo'

DataMapper.finalize
DataMapper.auto_upgrade!


class LocationSite < Sinatra::Application
	enable :sessions

end

def define_location(value_array)
	location = LocalLocation.new(value_array[1])
	location.location = value_array[0]
	location.description = value_array[2]
	location.photos = value_array[3]
	location
end

def get_locations(file)
	file = File.new(file,"r")
	file.each_line.inject([]) {|array, line| array << define_location(line.split(":"))}
end