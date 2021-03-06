require 'docking_station'
require 'bike'

describe DockingStation do
	
	let (:old_street) { DockingStation.new(capacity: 20) }
	let (:bike) { Bike.new }
	let (:broken_bike) { Bike.new.break! }
	let (:working_bike) { Bike.new }

	it 'should start with no bikes' do
		expect(old_street.bikes).to eq []
	end

	it 'should accept a bike' do
		old_street.dock(bike)
		expect(old_street.bikes).to eq [bike]
		expect(old_street.bike_count).to eq 1
	end

	it 'should know its own bike count' do
		expect(old_street.bike_count).to eq 0
	end

	it 'should be able to release a bike' do
	  old_street.dock(bike)
		old_street.release(bike)
		expect(old_street.bike_count).to eq 0
	end

	it 'should know when its at capacity' do
		expect(old_street).not_to be_full
		20.times { old_street.dock(Bike.new) }
		expect(old_street).to be_full
	end

	it 'should not accept any more bikes beyond capacity' do
		20.times { old_street.dock(Bike.new) }
		expect( lambda {old_street.dock(bike)}).to raise_error(RuntimeError)
	end

	it 'should provide a list of available bikes' do
		old_street.dock(working_bike)
		old_street.dock(broken_bike)
		expect(old_street.available_bikes).to eq([working_bike])
	end

end