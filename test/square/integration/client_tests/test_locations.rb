# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Locations::Client do
  describe "#list" do
    it "should list locations" do
      skip "Skipping for now."
      _request = {}

      puts "request #{_request}" if verbose?

      response = client.locations.list
      refute_nil response.locations
      assert response.locations.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end
end