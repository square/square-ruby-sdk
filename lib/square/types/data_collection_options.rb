# frozen_string_literal: true

module Square
  class DataCollectionOptions < Internal::Types::Model
    field :title, String, optional: false, nullable: false
    field :body, String, optional: false, nullable: false
    field :input_type, Square::DataCollectionOptionsInputType, optional: false, nullable: false
    field :collected_data, Square::CollectedData, optional: true, nullable: false

  end
end
