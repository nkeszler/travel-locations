require 'location'

describe 'Location' do 

	let(:location) {LocalLocation.new('China')}

	it "should initialize with a name" do 
		expect(location.name).not_to eq(nil)
	end

	it "should have an array for photos" do
		expect(location.photos).to be_a(Array)
	end 

	it "should have a description" do
		expect(location.respond_to?('description')).to be_true
	end

	it "should have coordinates" do 
		expect(location.respond_to?('coordinates')).to be_true
	end

	it "should have a Wikipedia Link" do 
		expect(location.respond_to?('wiki_link')).to be_true
	end

end