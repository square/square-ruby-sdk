# frozen_string_literal: true

require "custom/test_helper"

describe Square::Customers::Segments::Client do
  describe "#list" do
    it "should list customer segments" do

      response = client.customers.segments.list
      refute_nil response
      assert_equal Square::Internal::CursorItemIterator, response.class

      # Iterate using the iterator pattern
      segments = []
      response.each do |segment|
        segments << segment
      end

      puts "response segments_count=#{segments.length}" if verbose?
    end
  end

  describe "#get" do
    it "should retrieve a customer segment" do

      list_response = client.customers.segments.list
      # Get first segment using iterator
      first_segment = nil
      list_response.each do |segment|
        first_segment = segment
        break
      end

      skip "No segments available to test" if first_segment.nil?

      segment_id = first_segment.id

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