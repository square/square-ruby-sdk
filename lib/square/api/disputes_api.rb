module Square
  # DisputesApi
  class DisputesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Returns a list of disputes associated with a particular account.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. For more information, see
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # .
    # @param [DisputeState] states Optional parameter: The dispute states used
    # to filter the result. If not specified, the endpoint returns all
    # disputes.
    # @param [String] location_id Optional parameter: The ID of the location for
    # which to return a list of disputes. If not specified, the endpoint returns
    # disputes associated with all locations.
    # @return [ListDisputesResponse Hash] response from the API call
    def list_disputes(cursor: nil,
                      states: nil,
                      location_id: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor,
        'states' => states,
        'location_id' => location_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Returns details about a specific dispute.
    # @param [String] dispute_id Required parameter: The ID of the dispute you
    # want more details about.
    # @return [RetrieveDisputeResponse Hash] response from the API call
    def retrieve_dispute(dispute_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => { 'value' => dispute_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Accepts the loss on a dispute. Square returns the disputed amount to the
    # cardholder and
    # updates the dispute state to ACCEPTED.
    # Square debits the disputed amount from the seller’s Square account. If the
    # Square account
    # does not have sufficient funds, Square debits the associated bank account.
    # @param [String] dispute_id Required parameter: The ID of the dispute you
    # want to accept.
    # @return [AcceptDisputeResponse Hash] response from the API call
    def accept_dispute(dispute_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/accept'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => { 'value' => dispute_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Returns a list of evidence associated with a dispute.
    # @param [String] dispute_id Required parameter: The ID of the dispute.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @return [ListDisputeEvidenceResponse Hash] response from the API call
    def list_dispute_evidence(dispute_id:,
                              cursor: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/evidence'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => { 'value' => dispute_id, 'encode' => true }
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Uploads a file to use as evidence in a dispute challenge. The endpoint
    # accepts HTTP
    # multipart/form-data file uploads in HEIC, HEIF, JPEG, PDF, PNG, and TIFF
    # formats.
    # @param [String] dispute_id Required parameter: The ID of the dispute for
    # which you want to upload evidence.
    # @param [CreateDisputeEvidenceFileRequest] request Optional parameter:
    # Defines the parameters for a `CreateDisputeEvidenceFile` request.
    # @param [File | UploadIO] image_file Optional parameter: Example:
    # @return [CreateDisputeEvidenceFileResponse Hash] response from the API call
    def create_dispute_evidence_file(dispute_id:,
                                     request: nil,
                                     image_file: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/evidence-files'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => { 'value' => dispute_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      if image_file.is_a? FileWrapper
        image_file_wrapper = image_file.file
        image_file_content_type = image_file.content_type
      else
        image_file_wrapper = image_file
        image_file_content_type = 'image/jpeg'
      end

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare form parameters.
      _parameters = {
        'request' => Faraday::UploadIO.new(
          StringIO.new(request.to_json),
          'application/json'
        ),
        'image_file' => Faraday::UploadIO.new(
          image_file_wrapper,
          image_file_content_type
        )
      }
      _parameters = APIHelper.form_encode_parameters(_parameters)

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: _parameters
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Uploads text to use as evidence for a dispute challenge.
    # @param [String] dispute_id Required parameter: The ID of the dispute for
    # which you want to upload evidence.
    # @param [CreateDisputeEvidenceTextRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [CreateDisputeEvidenceTextResponse Hash] response from the API call
    def create_dispute_evidence_text(dispute_id:,
                                     body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/evidence-text'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => { 'value' => dispute_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Removes specified evidence from a dispute.
    # Square does not send the bank any evidence that is removed.
    # @param [String] dispute_id Required parameter: The ID of the dispute from
    # which you want to remove evidence.
    # @param [String] evidence_id Required parameter: The ID of the evidence you
    # want to remove.
    # @return [DeleteDisputeEvidenceResponse Hash] response from the API call
    def delete_dispute_evidence(dispute_id:,
                                evidence_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/evidence/{evidence_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => { 'value' => dispute_id, 'encode' => true },
        'evidence_id' => { 'value' => evidence_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Returns the metadata for the evidence specified in the request URL path.
    # You must maintain a copy of any evidence uploaded if you want to reference
    # it later. Evidence cannot be downloaded after you upload it.
    # @param [String] dispute_id Required parameter: The ID of the dispute from
    # which you want to retrieve evidence metadata.
    # @param [String] evidence_id Required parameter: The ID of the evidence to
    # retrieve.
    # @return [RetrieveDisputeEvidenceResponse Hash] response from the API call
    def retrieve_dispute_evidence(dispute_id:,
                                  evidence_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/evidence/{evidence_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => { 'value' => dispute_id, 'encode' => true },
        'evidence_id' => { 'value' => evidence_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Submits evidence to the cardholder's bank.
    # The evidence submitted by this endpoint includes evidence uploaded
    # using the
    # [CreateDisputeEvidenceFile]($e/Disputes/CreateDisputeEvidenceFile) and
    # [CreateDisputeEvidenceText]($e/Disputes/CreateDisputeEvidenceText)
    # endpoints and
    # evidence automatically provided by Square, when available. Evidence cannot
    # be removed from
    # a dispute after submission.
    # @param [String] dispute_id Required parameter: The ID of the dispute for
    # which you want to submit evidence.
    # @return [SubmitEvidenceResponse Hash] response from the API call
    def submit_evidence(dispute_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/submit-evidence'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => { 'value' => dispute_id, 'encode' => true }
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
