# frozen_string_literal: true

module Square
  module TeamMembers
    module WageSetting
      class Client
        # @return [Square::TeamMembers::WageSetting::Client]
        def initialize(client:)
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
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/team-members/#{params[:team_member_id]}/wage-setting"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetWageSettingResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
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
          _path_param_names = ["team_member_id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "PUT",
            path: "v2/team-members/#{params[:team_member_id]}/wage-setting",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateWageSettingResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
