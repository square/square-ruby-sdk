require_relative './helpers'
require_relative './integration_test_base'

class TeamsTest < IntegrationTestBase
  def setup
    setup_class
  end

  def test_should_bulk_update_team_members_with_mix_of_successes_and_failures
    # Get default location ID
    locations_response = @client.locations.list
    location_id = locations_response.locations.first.id
    refute_nil location_id

    # SETUP: Create 3 team members (should always be successful)
    create_members_resp = @client.team_members.batch_create(
      team_members: {
        new_test_uuid => {
          team_member: create_test_team_member([location_id])
        },
        new_test_uuid => {
          team_member: create_test_team_member([location_id])
        },
        new_test_uuid => {
          team_member: create_test_team_member([location_id])
        }
      }
    )

    refute_nil create_members_resp.team_members

    created_member_ids = []
    create_members_resp.team_members.values.each do |response|
      member_id = response.team_member.id
      refute_nil member_id
      assert_nil response.errors
      created_member_ids << member_id
    end

    # Update 3 team members in a bulk request, with 2 successful updates and 1
    # invalid update (location ID is invalid). This should result in a 200
    # response, with 2 nested success responses and 1 nested error response.
    update_team_members_resp = @client.team_members.batch_update(
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
    )

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
  end

  private

  # Helper function to create a test team member
  def create_test_team_member(location_ids)
    Square::Types::TeamMember.new(
      assigned_locations: Square::Types::TeamMemberAssignedLocations.new(
        assignment_type: "EXPLICIT_LOCATIONS",
        location_ids: location_ids
      ),
      family_name: "Doe",
      given_name: "Jane"
    )
  end
end
