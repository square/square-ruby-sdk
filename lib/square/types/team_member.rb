# frozen_string_literal: true

module Square
  module Types
    # A record representing an individual team member for a business.
    class TeamMember < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :reference_id, -> { String }, optional: true, nullable: false
      field :is_owner, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :status, -> { Square::Types::TeamMemberStatus }, optional: true, nullable: false
      field :given_name, -> { String }, optional: true, nullable: false
      field :family_name, -> { String }, optional: true, nullable: false
      field :email_address, -> { String }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :assigned_locations, -> { Square::Types::TeamMemberAssignedLocations }, optional: true, nullable: false
      field :wage_setting, -> { Square::Types::WageSetting }, optional: true, nullable: false
    end
  end
end
