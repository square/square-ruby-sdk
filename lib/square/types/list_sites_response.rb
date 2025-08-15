# frozen_string_literal: true

module Square
  # Represents a `ListSites` response. The response can include either `sites` or `errors`.
  class ListSitesResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :sites, Internal::Types::Array[Square::Site], optional: true, nullable: false

  end
end
