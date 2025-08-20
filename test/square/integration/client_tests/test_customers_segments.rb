# frozen_string_literal: true

require "test_helper"

describe Square::Customers::Segments::Client do
  describe "#list" do
    it "should list customer segments" do
      skip "Skipping for now."
      
      response = client.customers.segments.list
      refute_nil response
      assert_equal response.class, Square::Types::ListCustomerSegmentsResponse
      refute_nil response.segments

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should retrieve a customer segment" do
      skip "Skipping for now."
      list_response = client.customers.segments.list
      segment_id = list_response.segments.first.id

      _request = Square::Customers::Segments::Types::GetCustomerSegmentRequest.new(
        segment_id: segment_id
      )

      response = client.customers.segments.get(**_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::GetCustomerSegmentResponse
      refute_nil response.segment
      refute_nil response.segment.name

      puts "response #{response.to_h}" if verbose?
    end
  end
end