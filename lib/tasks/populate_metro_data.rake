# store csv info into psql
task :populate_metro_data, [:filename, :model] => [:environment] do |t, args|
	require 'csv'

	# clear previous data
	Module.const_get(args[:model]).delete_all
	
	# read lines from csv, create table headers from csv header
	lines = File.new(args[:filename]).readlines
	header = lines.shift.strip
	keys = header.split(',')
	
	# for each line, store value in relevant column
	lines.each do |line|
		values = line.strip.split(',')
		attributes = Hash[keys.zip values]
		Module.const_get(args[:model]).create(attributes)
	end
end


# populate table with useful route data
task :aggregate_route_data => [:environment] do

	RouteRaw.find_each do |raw_route|
		route = Route.new

		route.route_id = raw_route.route_id
		route.route_short_name = raw_route.route_short_name
		route.route_long_name = raw_route.route_long_name
		route.route_desc = raw_route.route_desc

		route.save
	end
end


# populate table with useful stop data
task :aggregate_stop_data => [:environment] do

	StopRaw.find_each do |raw_stop|
		stop = Stop.new

		stop.stop_id = raw_stop.stop_id
		stop.stop_name = raw_stop.stop_name
		stop.stop_lat = raw_stop.stop_lat
		stop.stop_lon = raw_stop.stop_lon

		stop.save
	end
end


# draw relationship between routes and stops
task :collect_route_stops => [:environment] do

	# cache data from trips
	trip_route = Hash.new
	trip_direction = Hash.new
	trip_stops = Hash.new
	longest_route = Hash.new

	# for each stop_time...
	StopTimes.find_each do |stop_time|
		# create a new array if current stop doesn't exist in trip_stops
		unless trip_stops.include? (stop_time.trip_id)
			trip_stops[trip_id] = []
		end
		# otherwise, store current stop in array
		trip_stops[trip_id] << { stop_id: stop_time.stop_id, stop_time: stop_time.start_time, stop_sequence: stop_time.stop_sequence }

		# clear trip_stops before proceeding
		trip_stops = nil



	end

	TripRaw.all.each do |trip|
		trip_route[trip.trip_id] = trip.route_id
		trip_direction[trip.trip_id] = trip.direction_id
	end

	# StopTimeRaw.find_each do |stop_time|
		# trip_stops = Hash.new
		# longest_route_forward = Hash.new
		# longest_route_backwards = Hash.new
		# stop_times.find_each do |stop_time|
			# if stop_time.trip_id in trip_stops:
				# trip_stops[trip_id] = []
				# trip_stops << {stop_id: stop_time.stop_id, stop_time:start_time}
			# end
		# end
	# end

	# for key in trip_stops:
	# 
end
