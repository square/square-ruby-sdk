# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a Square Online site, which is an online store for a Square seller.
    class Site < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :site_title, -> { String }, optional: true, nullable: true

      field :domain, -> { String }, optional: true, nullable: true

      field :is_published, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
