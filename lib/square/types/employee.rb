# frozen_string_literal: true

module Square
  module Types
    # An employee object that is used by the external API.
    # 
    # DEPRECATED at version 2020-08-26. Replaced by [TeamMember](entity:TeamMember).
    class Employee < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :first_name, String, optional: true, nullable: false
      field :last_name, String, optional: true, nullable: false
      field :email, String, optional: true, nullable: false
      field :phone_number, String, optional: true, nullable: false
      field :location_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :status, Square::EmployeeStatus, optional: true, nullable: false
      field :is_owner, Internal::Types::Boolean, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false

    end
  end
end
