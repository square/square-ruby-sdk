module Square
  # DisputesApi
  class DisputesApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Returns a list of disputes associated
    # with a particular account.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for the original query. For more information, see
    # [Paginating](https://developer.squareup.com/docs/basics/api101/pagination)
    # .
    # @param [DisputeState] states Optional parameter: The dispute states to
    # filter the result. If not specified, the endpoint returns all open
    # disputes (dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`).
    # @param [String] location_id Optional parameter: The ID of the location for
    # which to return  a list of disputes. If not specified, the endpoint
    # returns all open disputes (dispute status is not `INQUIRY_CLOSED`, `WON`,
    # or  `LOST`) associated with all locations.
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns details of a specific dispute.
    # @param [String] dispute_id Required parameter: The ID of the dispute you
    # want more details about.
    # @return [RetrieveDisputeResponse Hash] response from the API call
    def retrieve_dispute(dispute_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => dispute_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Accepts loss on a dispute. Square returns
    # the disputed amount to the cardholder and updates the
    # dispute state to ACCEPTED.
    # Square debits the disputed amount from the seller’s Square
    # account. If the Square account balance does not have
    # sufficient funds, Square debits the associated bank account.
    # For an overview of the Disputes API, see
    # [Overview](https://developer.squareup.com/docs/docs/disputes-api/overview)
    # .
    # @param [String] dispute_id Required parameter: ID of the dispute you want
    # to accept.
    # @return [AcceptDisputeResponse Hash] response from the API call
    def accept_dispute(dispute_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/accept'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => dispute_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns a list of evidence associated with a dispute.
    # @param [String] dispute_id Required parameter: The ID of the dispute.
    # @return [ListDisputeEvidenceResponse Hash] response from the API call
    def list_dispute_evidence(dispute_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/evidence'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => dispute_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Removes specified evidence from a dispute.
    # Square does not send the bank any evidence that
    # is removed. Also, you cannot remove evidence after
    # submitting it to the bank using
    # [SubmitEvidence](https://developer.squareup.com/docs/reference/square/disp
    # utes-api/submit-evidence).
    # @param [String] dispute_id Required parameter: The ID of the dispute you
    # want to remove evidence from.
    # @param [String] evidence_id Required parameter: The ID of the evidence you
    # want to remove.
    # @return [RemoveDisputeEvidenceResponse Hash] response from the API call
    def remove_dispute_evidence(dispute_id:,
                                evidence_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/evidence/{evidence_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => dispute_id,
        'evidence_id' => evidence_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns the specific evidence metadata associated with a specific dispute.
    # You must maintain a copy of the evidence you upload if you want to
    # reference it later. You cannot download the evidence
    # after you upload it.
    # @param [String] dispute_id Required parameter: The ID of the dispute that
    # you want to retrieve evidence from.
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
        'dispute_id' => dispute_id,
        'evidence_id' => evidence_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Uploads a file to use as evidence in a dispute challenge. The endpoint
    # accepts
    # HTTP multipart/form-data file uploads in HEIC, HEIF, JPEG, PDF, PNG,
    # and TIFF formats.
    # For more information, see [Challenge a
    # Dispute](https://developer.squareup.com/docs/docs/disputes-api/process-dis
    # putes#challenge-a-dispute).
    # @param [String] dispute_id Required parameter: ID of the dispute you want
    # to upload evidence for.
    # @param [CreateDisputeEvidenceFileRequest] request Optional parameter:
    # Defines parameters for a CreateDisputeEvidenceFile request.
    # @param [File | UploadIO] image_file Optional parameter: Example:
    # @return [CreateDisputeEvidenceFileResponse Hash] response from the API call
    def create_dispute_evidence_file(dispute_id:,
                                     request: nil,
                                     image_file: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/evidence_file'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => dispute_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Uploads text to use as evidence for a dispute challenge. For more
    # information, see
    # [Challenge a
    # Dispute](https://developer.squareup.com/docs/docs/disputes-api/process-dis
    # putes#challenge-a-dispute).
    # @param [String] dispute_id Required parameter: The ID of the dispute you
    # want to upload evidence for.
    # @param [CreateDisputeEvidenceTextRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [CreateDisputeEvidenceTextResponse Hash] response from the API call
    def create_dispute_evidence_text(dispute_id:,
                                     body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/evidence_text'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => dispute_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Submits evidence to the cardholder's bank.
    # Before submitting evidence, Square compiles all available evidence. This
    # includes
    # evidence uploaded using the
    # [CreateDisputeEvidenceFile](https://developer.squareup.com/docs/reference/
    # square/disputes-api/create-dispute-evidence-file) and
    # [CreateDisputeEvidenceText](https://developer.squareup.com/docs/reference/
    # square/disputes-api/create-dispute-evidence-text) endpoints,
    # and evidence automatically provided by Square, when
    # available. For more information, see
    # [Challenge a
    # Dispute](https://developer.squareup.com/docs/docs/disputes-api/process-dis
    # putes#challenge-a-dispute).
    # @param [String] dispute_id Required parameter: The ID of the dispute you
    # want to submit evidence for.
    # @return [SubmitEvidenceResponse Hash] response from the API call
    def submit_evidence(dispute_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/disputes/{dispute_id}/submit-evidence'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'dispute_id' => dispute_id
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
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
