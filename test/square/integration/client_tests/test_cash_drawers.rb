# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::CashDrawers::Shifts::Client do
  describe "#list" do
    it "list cash drawer shifts" do
      start_time = Time.now - 3600  # 1 hour ago
      end_time = Time.now
      
      _request = {
        location_id: client.locations.list.locations.first.id,
        begin_time: start_time.iso8601,
        end_time: end_time.iso8601
      }

      puts "request #{_request}" if verbose?

      response = client.cash_drawers.shifts.list(
        location_id: _request[:location_id],
        begin_time: _request[:begin_time],
        end_time: _request[:end_time]
      )
      refute_nil response

      puts "response #{response.to_h}" if verbose?
    end
  end
end