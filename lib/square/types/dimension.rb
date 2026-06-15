# frozen_string_literal: true

module Square
  module Types
    class Dimension < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: true, nullable: false
      field :short_title, -> { String }, optional: true, nullable: false, api_name: "shortTitle"
      field :description, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :alias_member, -> { String }, optional: true, nullable: false, api_name: "aliasMember"
      field :granularities, -> { Internal::Types::Array[Square::Types::DimensionGranularity] }, optional: true, nullable: false
      field :meta, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :format, -> { Square::Types::Format }, optional: true, nullable: false
      field :format_description, -> { Square::Types::FormatDescription }, optional: true, nullable: false, api_name: "formatDescription"
      field :currency, -> { String }, optional: true, nullable: false
      field :order, -> { Square::Types::DimensionOrder }, optional: true, nullable: false
      field :key, -> { String }, optional: true, nullable: false
    end
  end
end
