# frozen_string_literal: true

module Square
  module Types
    class Measure < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: true, nullable: false
      field :short_title, -> { String }, optional: true, nullable: false, api_name: "shortTitle"
      field :description, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :agg_type, -> { String }, optional: true, nullable: false, api_name: "aggType"
      field :meta, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :format, -> { Square::Types::Format }, optional: true, nullable: false
      field :format_description, -> { Square::Types::FormatDescription }, optional: true, nullable: false, api_name: "formatDescription"
      field :currency, -> { String }, optional: true, nullable: false
      field :alias_member, -> { String }, optional: true, nullable: false, api_name: "aliasMember"
    end
  end
end
