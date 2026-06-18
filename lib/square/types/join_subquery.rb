# frozen_string_literal: true

module Square
  module Types
    class JoinSubquery < Internal::Types::Model
      field :sql, -> { String }, optional: false, nullable: false
      field :on, -> { String }, optional: false, nullable: false
      field :join_type, -> { String }, optional: false, nullable: false, api_name: "joinType"
      field :alias_, -> { String }, optional: false, nullable: false, api_name: "alias"
    end
  end
end
