# frozen_string_literal: true

module Square
  module Disputes
    module Evidence
      module Types
        class ListEvidenceRequest < Internal::Types::Model
          field :dispute_id, -> { String }, optional: false, nullable: false

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
