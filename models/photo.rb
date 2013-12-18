class Photo
	include DataMapper::Resource

	property :id, Serial
	property :path, String

	belongs_to :location, :required => false
end