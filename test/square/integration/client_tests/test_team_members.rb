# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::TeamMembers::Client do
  def create_test_team_member(location_ids)
    Square::TeamMembers::Types::TeamMember.new(
      assigned_locations: Square::TeamMembers::Types::TeamMemberAssignedLocations.new(
        assignment_type: "EXPLICIT_LOCATIONS",
        location_ids: location_ids
      ),
      family_name: "Doe",
      given_name: "Jane"
    )
  end

  describe "#batch_update" do
    it "should bulk update team members with mix of successes and failures" do
      skip "Skipping for now."
      # Get default location ID
      locations_response = client.locations.list
      location_id = locations_response.locations.first.id
      refute_nil location_id

      # SETUP: Create 3 team members (should always be successful)
      _create_request = {
        team_members: {
          SecureRandom.uuid => {
            team_member: create_test_team_member([location_id])
          },
          SecureRandom.uuid => {
            team_member: create_test_team_member([location_id])
          },
          SecureRandom.uuid => {
            team_member: create_test_team_member([location_id])
          }
        }
      }

      puts "create_request #{_create_request.to_h}" if verbose?

      create_members_resp = client.team_members.batch_create(request: _create_request.to_h)
      refute_nil create_members_resp.team_members

      created_member_ids = []
      create_members_resp.team_members.values.each do |response|
        member_id = response.team_member.id
        refute_nil member_id
        assert_nil response.errors
        created_member_ids << member_id
      end

      puts "create_response #{create_members_resp.to_h}" if verbose?

      # Update 3 team members in a bulk request, with 2 successful updates and 1
      # invalid update (location ID is invalid). This should result in a 200
      # response, with 2 nested success responses and 1 nested error response.
      _update_request = {
        team_members: {
          created_member_ids[0] => {
            team_member: create_test_team_member([location_id])
          },
          created_member_ids[1] => {
            team_member: create_test_team_member([location_id])
          },
          created_member_ids[2] => {
            team_member: create_test_team_member(["INVALID_LocationID"])
          }
        }
      }

      puts "update_request #{_update_request.to_h}" if verbose?

      update_team_members_resp = client.team_members.batch_update(request: _update_request.to_h)

      team_members = update_team_members_resp.team_members
      assert_equal 3, team_members.keys.length

      member1_errors = team_members[created_member_ids[0]].errors
      member2_errors = team_members[created_member_ids[1]].errors
      member3_errors = team_members[created_member_ids[2]].errors

      assert_nil member1_errors
      assert_nil member2_errors
      refute_nil member3_errors
      assert_equal "INVALID_VALUE", member3_errors.first.code
      assert_equal "Expected the assigned_locations.location_ids to be valid", member3_errors.first.detail

      puts "update_response #{update_team_members_resp.to_h}" if verbose?
    end
  end
end