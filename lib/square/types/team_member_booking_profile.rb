# frozen_string_literal: true

module Square
  module Types
    # The booking profile of a seller's team member, including the team member's ID, display name, description and whether the team member can be booked as a service provider.
    class TeamMemberBookingProfile < Internal::Types::Model
      field :team_member_id, String, optional: true, nullable: false
      field :description, String, optional: true, nullable: false
      field :display_name, String, optional: true, nullable: false
      field :is_bookable, Internal::Types::Boolean, optional: true, nullable: false
      field :profile_image_url, String, optional: true, nullable: false

    end
  end
end
