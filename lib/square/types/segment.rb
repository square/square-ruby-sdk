# frozen_string_literal: true

module Square
  module Types
    class Segment < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :short_title, -> { String }, optional: false, nullable: false, api_name: "shortTitle"
      field :meta, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
