# frozen_string_literal: true

module Square
  module TeamMembers
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Creates a single `TeamMember` object. The `TeamMember` object is returned on successful creates.
      # You must provide the following values in your request to this endpoint:
      # - `given_name`
      # - `family_name`
      #
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#createteammember).
      #
      # @param request_options [Hash]
      # @param params [Square::Types::CreateTeamMemberRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.team_members.create(
      #     idempotency_key: "idempotency-key-0",
      #     team_member: {
      #       reference_id: "reference_id_1",
      #       status: "ACTIVE",
      #       given_name: "Joe",
      #       family_name: "Doe",
      #       email_address: "joe_doe@gmail.com",
      #       phone_number: "+14159283333",
      #       assigned_locations: {
      #         assignment_type: "EXPLICIT_LOCATIONS",
      #         location_ids: %w[YSGH2WBKG94QZ GA2Y9HSJ8KRYT]
      #       },
      #       wage_setting: {
      #         job_assignments: [{
      #           pay_type: "SALARY",
      #           annual_rate: {
      #             amount: 3000000,
      #             currency: "USD"
      #           },
      #           weekly_hours: 40,
      #           job_id: "FjS8x95cqHiMenw4f1NAUH4P"
      #         }, {
      #           pay_type: "HOURLY",
      #           hourly_rate: {
      #             amount: 2000,
      #             currency: "USD"
      #           },
      #           job_id: "VDNpRv8da51NU8qZFC5zDWpF"
      #         }],
      #         is_overtime_exempt: true
      #       }
      #     }
      #   )
      #
      # @return [Square::Types::CreateTeamMemberResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/team-members",
          body: Square::Types::CreateTeamMemberRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateTeamMemberResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates multiple `TeamMember` objects. The created `TeamMember` objects are returned on successful creates.
      # This process is non-transactional and processes as much of the request as possible. If one of the creates in
      # the request cannot be successfully processed, the request is not marked as failed, but the body of the response
      # contains explicit error information for the failed create.
      #
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#bulk-create-team-members).
      #
      # @param request_options [Hash]
      # @param params [Square::TeamMembers::Types::BatchCreateTeamMembersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.team_members.batch_create(team_members: {
      #     "idempotency-key-1" => {
      #       team_member: {
      #         reference_id: "reference_id_1",
      #         given_name: "Joe",
      #         family_name: "Doe",
      #         email_address: "joe_doe@gmail.com",
      #         phone_number: "+14159283333",
      #         assigned_locations: {
      #           assignment_type: "EXPLICIT_LOCATIONS",
      #           location_ids: %w[YSGH2WBKG94QZ GA2Y9HSJ8KRYT]
      #         }
      #       }
      #     },
      #     "idempotency-key-2" => {
      #       team_member: {
      #         reference_id: "reference_id_2",
      #         given_name: "Jane",
      #         family_name: "Smith",
      #         email_address: "jane_smith@gmail.com",
      #         phone_number: "+14159223334",
      #         assigned_locations: {
      #           assignment_type: "ALL_CURRENT_AND_FUTURE_LOCATIONS"
      #         }
      #       }
      #     }
      #   })
      #
      # @return [Square::Types::BatchCreateTeamMembersResponse]
      def batch_create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/team-members/bulk-create",
          body: Square::TeamMembers::Types::BatchCreateTeamMembersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchCreateTeamMembersResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates multiple `TeamMember` objects. The updated `TeamMember` objects are returned on successful updates.
      # This process is non-transactional and processes as much of the request as possible. If one of the updates in
      # the request cannot be successfully processed, the request is not marked as failed, but the body of the response
      # contains explicit error information for the failed update.
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#bulk-update-team-members).
      #
      # @param request_options [Hash]
      # @param params [Square::TeamMembers::Types::BatchUpdateTeamMembersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.team_members.batch_update(team_members: {
      #     "AFMwA08kR-MIF-3Vs0OE" => {
      #       team_member: {
      #         reference_id: "reference_id_2",
      #         is_owner: false,
      #         status: "ACTIVE",
      #         given_name: "Jane",
      #         family_name: "Smith",
      #         email_address: "jane_smith@gmail.com",
      #         phone_number: "+14159223334",
      #         assigned_locations: {
      #           assignment_type: "ALL_CURRENT_AND_FUTURE_LOCATIONS"
      #         }
      #       }
      #     },
      #     "fpgteZNMaf0qOK-a4t6P" => {
      #       team_member: {
      #         reference_id: "reference_id_1",
      #         is_owner: false,
      #         status: "ACTIVE",
      #         given_name: "Joe",
      #         family_name: "Doe",
      #         email_address: "joe_doe@gmail.com",
      #         phone_number: "+14159283333",
      #         assigned_locations: {
      #           assignment_type: "EXPLICIT_LOCATIONS",
      #           location_ids: %w[YSGH2WBKG94QZ GA2Y9HSJ8KRYT]
      #         }
      #       }
      #     }
      #   })
      #
      # @return [Square::Types::BatchUpdateTeamMembersResponse]
      def batch_update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/team-members/bulk-update",
          body: Square::TeamMembers::Types::BatchUpdateTeamMembersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchUpdateTeamMembersResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a paginated list of `TeamMember` objects for a business.
      # The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status, or whether
      # the team member is the Square account owner.
      #
      # @param request_options [Hash]
      # @param params [Square::TeamMembers::Types::SearchTeamMembersRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.team_members.search(
      #     query: {
      #       filter: {
      #         location_ids: ["0G5P3VGACMMQZ"],
      #         status: "ACTIVE"
      #       }
      #     },
      #     limit: 10
      #   )
      #
      # @return [Square::Types::SearchTeamMembersResponse]
      def search(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/team-members/search",
          body: Square::TeamMembers::Types::SearchTeamMembersRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::SearchTeamMembersResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a `TeamMember` object for the given `TeamMember.id`.
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).
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
      # @example
      #   client.team_members.get(team_member_id: "team_member_id")
      #
      # @return [Square::Types::GetTeamMemberResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/team-members/#{URI.encode_uri_component(params[:team_member_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetTeamMemberResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a single `TeamMember` object. The `TeamMember` object is returned on successful updates.
      # Learn about [Troubleshooting the Team
      # API](https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).
      #
      # @param request_options [Hash]
      # @param params [Square::Types::UpdateTeamMemberRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :team_member_id
      #
      # @example
      #   client.team_members.update(
      #     team_member_id: "team_member_id",
      #     team_member: {
      #       reference_id: "reference_id_1",
      #       status: "ACTIVE",
      #       given_name: "Joe",
      #       family_name: "Doe",
      #       email_address: "joe_doe@gmail.com",
      #       phone_number: "+14159283333",
      #       assigned_locations: {
      #         assignment_type: "EXPLICIT_LOCATIONS",
      #         location_ids: %w[YSGH2WBKG94QZ GA2Y9HSJ8KRYT]
      #       },
      #       wage_setting: {
      #         job_assignments: [{
      #           pay_type: "SALARY",
      #           annual_rate: {
      #             amount: 3000000,
      #             currency: "USD"
      #           },
      #           weekly_hours: 40,
      #           job_id: "FjS8x95cqHiMenw4f1NAUH4P"
      #         }, {
      #           pay_type: "HOURLY",
      #           hourly_rate: {
      #             amount: 1200,
      #             currency: "USD"
      #           },
      #           job_id: "VDNpRv8da51NU8qZFC5zDWpF"
      #         }],
      #         is_overtime_exempt: true
      #       }
      #     }
      #   )
      #
      # @return [Square::Types::UpdateTeamMemberResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[team_member_id]
        body_params = params.except(*path_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/team-members/#{URI.encode_uri_component(params[:team_member_id].to_s)}",
          body: Square::Types::UpdateTeamMemberRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::UpdateTeamMemberResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::WageSetting::Client]
      def wage_setting
        @wage_setting ||= Square::TeamMembers::WageSetting::Client.new(client: @client)
      end
    end
  end
end
