# frozen_string_literal: true

require "test_helper"

describe Square::CashDrawers::Shifts::Client do
  describe "#list" do
    it "list cash drawer shifts" do
      skip "Skipping for now."
      start_time = Time.now - 3600  # 1 hour ago
      end_time = Time.now
      
      _request = Square::CashDrawers::Shifts::Types::ListShiftsRequest.new(
        location_id: client.locations.list.locations.first.id,
        begin_time: start_time.iso8601,
        end_time: end_time.iso8601
      )

      puts "request #{_request.to_h}" if verbose?

      response = client.cashDrawers.shifts.list(**_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::ListCashDrawerShiftsResponse

      puts "response #{response.to_h}" if verbose?
    end
  end
end