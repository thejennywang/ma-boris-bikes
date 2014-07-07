require './lib/bike_container'
require 'bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }
	let(:working_bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }

	it 'should accept a bike' do
		expect(holder.bike_count).to eq 0
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
	end

	it 'release a bike' do
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
		holder.release(bike)
		expect(holder.bike_count).to eq 0
	end

	it 'should not accept bikes if full' do
		10.times { holder.dock(Bike.new) }
		expect( lambda { holder.dock(bike) } ).to raise_error(RuntimeError)
	end

	it 'should know which bikes are available' do
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end
end