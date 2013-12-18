class Location
	include DataMapper::Resource

	has n, :photos, :required => false
	has n, :users, :through => Resource

	property :id, Serial
	property :name, String
	property :location, String
	property :description, Text
	property :wiki_link, String

end