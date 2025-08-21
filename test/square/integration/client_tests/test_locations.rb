# frozen_string_literal: true

require "test_helper"

describe Square::Locations::Client do
  describe "#list" do
    it "should list locations" do

      response = client.locations.list
      refute_nil response
      assert_equal response.class, Square::Types::ListLocationsResponse
      refute_nil response.locations
      assert response.locations.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end
end