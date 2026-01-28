# frozen_string_literal: true

module Square
  module TeamMembers
    module WageSetting
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieves a `WageSetting` object for a team member specified
        # by `TeamMember.id`. For more information, see
        # [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).
        #
        # Square recommends using [RetrieveTeamMember](api-endpoint:Team-RetrieveTeamMember) or
        # [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
        # to get this information directly from the `TeamMember.wage_setting` field.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :team_member_id
        #
        # @return [Square::Types::GetWageSettingResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/team-members/#{params[:team_member_id]}/wage-setting",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetWageSettingResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates or updates a `WageSetting` object. The object is created if a
        # `WageSetting` with the specified `team_member_id` doesn't exist. Otherwise,
        # it fully replaces the `WageSetting` object for the team member.
        # The `WageSetting` is returned on a successful update. For more information, see
        # [Troubleshooting the Team
        # API](https://developer.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).
        #
        # Square recommends using [CreateTeamMember](api-endpoint:Team-CreateTeamMember) or
        # [UpdateTeamMember](api-endpoint:Team-UpdateTeamMember)
        # to manage the `TeamMember.wage_setting` field directly.
        #
        # @param request_options [Hash]
        # @param params [Square::TeamMembers::WageSetting::Types::UpdateWageSettingRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :team_member_id
        #
        # @return [Square::Types::UpdateWageSettingResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::TeamMembers::WageSetting::Types::UpdateWageSettingRequest.new(params).to_h
          non_body_param_names = ["team_member_id"]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/team-members/#{params[:team_member_id]}/wage-setting",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateWageSettingResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
