require 'spec_helper'

describe RouteStop do
  describe "RouteStop database row" do
		it "should have information for all parameters" do
  		expect(:route_id).to be_a(String)
  		expect(:route_id).to be_a(String)
  		expect(:direction_id).to be_a(Integer)
  		expect(:stop_id).to be_a(String)
  		expect(:integer).to be_a(Integer)
  	end
  end
end
