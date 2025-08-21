# frozen_string_literal: true

module Square
  module Types
    # Represents a Square Online site, which is an online store for a Square seller.
    class Site < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :site_title, -> { String }, optional: true, nullable: false
      field :domain, -> { String }, optional: true, nullable: false
      field :is_published, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
