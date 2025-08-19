# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Inventory::Client do
  describe "#batch_get_changes" do
    it "gets inventory changes" do
      skip "Skipping for now."
      _request = {
        catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
        location_ids: ["C6W5YS5QM06F5"]
      }

      puts "request #{_request}" if verbose?

      response = client.inventory.batch_get_changes(request: _request)
      refute_nil response

      puts "response #{response.to_h}" if verbose?
    end
  end
end