require './application'

file = File.new("./public/locations_file.txt","r")

require './models/user'
require './models/location'
require './models/photo'

file.each do |line| 
	location, name, description, image =  line.split(':')
	destination = Location.create(location: location,
				 			   name: name,
				 			   description: description)
	puts destination.id
	photo = Photo.create(:path => image, 
						 :location => destination)
	puts destination.inspect
end

