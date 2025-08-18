# frozen_string_literal: true

module Square
  module Types
    # Represents a `ListSites` response. The response can include either `sites` or `errors`.
    class ListSitesResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :sites, -> { Internal::Types::Array[Square::Types::Site] }, optional: true, nullable: false

    end
  end
end
