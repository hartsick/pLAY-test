task :populate_metro_data, [:filename, :model] => [:environment] do |t, args|
	require 'csv'

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

task :collect_route_stops => [:environment] do
	# cache data from trips
	trip_route = Hash.new
	trip_direction = Hash.new

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
