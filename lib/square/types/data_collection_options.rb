# frozen_string_literal: true

module Square
  module Types
    class DataCollectionOptions < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false
      field :body, -> { String }, optional: false, nullable: false
      field :input_type, -> { Square::Types::DataCollectionOptionsInputType }, optional: false, nullable: false
      field :collected_data, -> { Square::Types::CollectedData }, optional: true, nullable: false

    end
  end
end
