
module Square
  module TeamMembers
    module WageSetting
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::TeamMembers::WageSetting::Client]
        def initialize(client)
          @client = client
        end

        # Retrieves a `WageSetting` object for a team member specified
        # by `TeamMember.id`. For more information, see
        # [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).
        # 
        # Square recommends using [RetrieveTeamMember](api-endpoint:Team-RetrieveTeamMember) or [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
        # to get this information directly from the `TeamMember.wage_setting` field.
        #
        # @return [Square::Types::GetWageSettingResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetWageSettingResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates or updates a `WageSetting` object. The object is created if a
        # `WageSetting` with the specified `team_member_id` doesn't exist. Otherwise,
        # it fully replaces the `WageSetting` object for the team member.
        # The `WageSetting` is returned on a successful update. For more information, see
        # [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).
        # 
        # Square recommends using [CreateTeamMember](api-endpoint:Team-CreateTeamMember) or [UpdateTeamMember](api-endpoint:Team-UpdateTeamMember)
        # to manage the `TeamMember.wage_setting` field directly.
        #
        # @return [Square::Types::UpdateWageSettingResponse]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateWageSettingResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
