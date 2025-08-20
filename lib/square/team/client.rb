# frozen_string_literal: true

module Square
  module Team
    class Client
      # @return [Square::Team::Client]
      def initialize(client:)
        @client = client
      end

      # Lists jobs in a seller account. Results are sorted by title in ascending order.
      #
      # @return [Square::Types::ListJobsResponse]
      def list_jobs(request_options: {}, **params)
        _query_param_names = ["cursor"]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/team-members/jobs",
          query: _query
        )
        _response = @client.send(_request)
        return Square::Types::ListJobsResponse.load(_response.body) if _response.code >= "200" && _response.code < "300"

        raise _response.body
      end

      # Creates a job in a seller account. A job defines a title and tip eligibility. Note that
      # compensation is defined in a [job assignment](entity:JobAssignment) in a team member's wage setting.
      #
      # @return [Square::Types::CreateJobResponse]
      def create_job(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/team-members/jobs",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateJobResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a specified job.
      #
      # @return [Square::Types::RetrieveJobResponse]
      def retrieve_job(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/team-members/jobs/#{params[:job_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RetrieveJobResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates the title or tip eligibility of a job. Changes to the title propagate to all
      # `JobAssignment`, `Shift`, and `TeamMemberWage` objects that reference the job ID. Changes to
      # tip eligibility propagate to all `TeamMemberWage` objects that reference the job ID.
      #
      # @return [Square::Types::UpdateJobResponse]
      def update_job(request_options: {}, **params)
        _path_param_names = ["job_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/team-members/jobs/#{params[:job_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateJobResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
