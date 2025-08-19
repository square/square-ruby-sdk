# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Inventory::Client do
  describe "#batch_get_changes" do
    it "gets inventory changes" do

      response = client.inventory.batch_get_changes(
        request: {
          catalog_object_ids: ["W62UWFY35CWMYGVWK6TWJDNI"],
          location_ids: ["C6W5YS5QM06F5"]
        }
      )

      refute_nil response
    end
  end
end
