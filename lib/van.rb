class Van
	include BikeContainer
	
	def pickup(bike)
		dock(bike)
	end
	
	def deliver(bikes)
		bikes.each { |bike| release(bike) if !bike.broken? }
	end

end