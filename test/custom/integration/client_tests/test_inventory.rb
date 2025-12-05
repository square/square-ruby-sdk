# frozen_string_literal: true

require "custom/test_helper"

describe Square::Inventory::Client do
  describe "#batch_get_changes" do
    it "gets inventory changes" do
      _time_yesterday = (Time.now.utc - 86400).iso8601
      _time_now = Time.now.utc.iso8601

      _request = Square::Types::BatchRetrieveInventoryChangesRequest.new(
        catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
        location_ids: [client.locations.list.locations.first.id],
        types: [Square::Types::InventoryChangeType::PHYSICAL_COUNT],
        states: [Square::Types::InventoryState::IN_STOCK],
        updated_after: _time_yesterday,
        updated_before: _time_now,
      )

      puts "request #{_request.to_h}" if verbose?

      response = client.inventory.batch_get_changes(**_request.to_h)
      refute_nil response
      assert_equal Square::Internal::CursorItemIterator, response.class

      # Iterate using the iterator pattern
      changes = []
      response.each do |change|
        changes << change
      end

      puts "response changes_count=#{changes.length}" if verbose?
    end
  end
end