# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # An employee object that is used by the external API.
    #
    # DEPRECATED at version 2020-08-26. Replaced by [TeamMember](entity:TeamMember).
    class Employee < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :first_name, -> { String }, optional: true, nullable: true

      field :last_name, -> { String }, optional: true, nullable: true

      field :email, -> { String }, optional: true, nullable: true

      field :phone_number, -> { String }, optional: true, nullable: true

      field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :status, -> { Square::Types::EmployeeStatus }, optional: true, nullable: false

      field :is_owner, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
