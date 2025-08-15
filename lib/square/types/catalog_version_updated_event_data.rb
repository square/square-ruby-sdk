# frozen_string_literal: true

module Square
  class CatalogVersionUpdatedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :object, Square::CatalogVersionUpdatedEventObject, optional: true, nullable: false

  end
end
