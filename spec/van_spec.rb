require 'bike_container'
require 'van'
require 'bike'

describe Van do
	
	let(:van) { Van.new }
	let(:working_bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }
	
	it 'should pickup bikes' do
		expect(van.bike_count).to eq 0
		van.pickup(broken_bike)
		expect(van.bike_count).to eq 1
	end

	it 'should deliver fixed bikes' do
		van.dock(broken_bike)
		van.dock(working_bike)
		expect(van.bike_count).to eq 2
		van.deliver([broken_bike, working_bike])
		expect(van.bike_count).to eq 1
	end


end