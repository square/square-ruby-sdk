# frozen_string_literal: true

module Square
  module Types
    class Hierarchy < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :alias_member, -> { String }, optional: true, nullable: false, api_name: "aliasMember"
      field :title, -> { String }, optional: true, nullable: false
      field :levels, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
