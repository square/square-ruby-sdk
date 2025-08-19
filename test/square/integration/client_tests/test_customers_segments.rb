# frozen_string_literal: true

require "test_helper"

describe Square::Customers::Segments::Client do
  describe "#list" do
    it "should list customer segments" do
      skip "Skipping for now."
      _request = {}

      puts "request #{_request.to_h}" if verbose?

      response = client.customers.segments.list
      refute_nil response.data
      assert response.data.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should retrieve a customer segment" do
      skip "Skipping for now."
      list_response = client.customers.segments.list
      segment_id = list_response.data.first.id

      _request = { segment_id: segment_id }

      puts "request #{_request.to_h}" if verbose?

      response = client.customers.segments.get(segment_id: segment_id)
      refute_nil response.segment
      refute_nil response.segment.name

      puts "response #{response.to_h}" if verbose?
    end
  end
end