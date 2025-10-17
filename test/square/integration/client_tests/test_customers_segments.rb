# frozen_string_literal: true

require "test_helper"

describe Square::Customers::Segments::Client do
  describe "#list" do
    it "should list customer segments" do

      response = client.customers.segments.list
      refute_nil response
      assert_equal Square::Internal::CursorItemIterator, response.class
      # Iterator wraps the response, we need to access the first page to get segments
      refute_nil response.to_a

      puts "response #{response.to_a}" if verbose?
    end
  end

  describe "#get" do
    it "should retrieve a customer segment" do
      list_response = client.customers.segments.list
      segments = list_response.to_a
      segment_id = segments.first.id

      _request = Square::Customers::Segments::Types::GetSegmentsRequest.new(
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