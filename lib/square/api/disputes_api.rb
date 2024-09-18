module Square
  # DisputesApi
  class DisputesApi < BaseApi
    # Returns a list of disputes associated with a particular account.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @param [DisputeState] states Optional parameter: The dispute states used
    # to filter the result. If not specified, the endpoint returns all
    # disputes.
    # @param [String] location_id Optional parameter: The ID of the location for
    # which to return a list of disputes. If not specified, the endpoint returns
    # disputes associated with all locations.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_disputes(cursor: nil,
                      states: nil,
                      location_id: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/disputes',
                                     'default')
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .query_param(new_parameter(states, key: 'states'))
                   .query_param(new_parameter(location_id, key: 'location_id'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns details about a specific dispute.
    # @param [String] dispute_id Required parameter: The ID of the dispute you
    # want more details about.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_dispute(dispute_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/disputes/{dispute_id}',
                                     'default')
                   .template_param(new_parameter(dispute_id, key: 'dispute_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Accepts the loss on a dispute. Square returns the disputed amount to the
    # cardholder and
    # updates the dispute state to ACCEPTED.
    # Square debits the disputed amount from the seller’s Square account. If the
    # Square account
    # does not have sufficient funds, Square debits the associated bank account.
    # @param [String] dispute_id Required parameter: The ID of the dispute you
    # want to accept.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def accept_dispute(dispute_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/disputes/{dispute_id}/accept',
                                     'default')
                   .template_param(new_parameter(dispute_id, key: 'dispute_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns a list of evidence associated with a dispute.
    # @param [String] dispute_id Required parameter: The ID of the dispute.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. For more information, see
    # [Pagination](https://developer.squareup.com/docs/build-basics/common-api-p
    # atterns/pagination).
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def list_dispute_evidence(dispute_id:,
                              cursor: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/disputes/{dispute_id}/evidence',
                                     'default')
                   .template_param(new_parameter(dispute_id, key: 'dispute_id')
                                    .should_encode(true))
                   .query_param(new_parameter(cursor, key: 'cursor'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_dispute_evidence_file(dispute_id:,
                                     request: nil,
                                     image_file: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/disputes/{dispute_id}/evidence-files',
                                     'default')
                   .template_param(new_parameter(dispute_id, key: 'dispute_id')
                                    .should_encode(true))
                   .multipart_param(new_parameter(StringIO.new(request.to_json), key: 'request')
                                     .default_content_type('application/json; charset=utf-8'))
                   .multipart_param(new_parameter(image_file, key: 'image_file')
                                     .default_content_type('image/jpeg'))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Uploads text to use as evidence for a dispute challenge.
    # @param [String] dispute_id Required parameter: The ID of the dispute for
    # which you want to upload evidence.
    # @param [CreateDisputeEvidenceTextRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_dispute_evidence_text(dispute_id:,
                                     body:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/disputes/{dispute_id}/evidence-text',
                                     'default')
                   .template_param(new_parameter(dispute_id, key: 'dispute_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end)
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Removes specified evidence from a dispute.
    # Square does not send the bank any evidence that is removed.
    # @param [String] dispute_id Required parameter: The ID of the dispute from
    # which you want to remove evidence.
    # @param [String] evidence_id Required parameter: The ID of the evidence you
    # want to remove.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def delete_dispute_evidence(dispute_id:,
                                evidence_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::DELETE,
                                     '/v2/disputes/{dispute_id}/evidence/{evidence_id}',
                                     'default')
                   .template_param(new_parameter(dispute_id, key: 'dispute_id')
                                    .should_encode(true))
                   .template_param(new_parameter(evidence_id, key: 'evidence_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end

    # Returns the metadata for the evidence specified in the request URL path.
    # You must maintain a copy of any evidence uploaded if you want to reference
    # it later. Evidence cannot be downloaded after you upload it.
    # @param [String] dispute_id Required parameter: The ID of the dispute from
    # which you want to retrieve evidence metadata.
    # @param [String] evidence_id Required parameter: The ID of the evidence to
    # retrieve.
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def retrieve_dispute_evidence(dispute_id:,
                                  evidence_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/v2/disputes/{dispute_id}/evidence/{evidence_id}',
                                     'default')
                   .template_param(new_parameter(dispute_id, key: 'dispute_id')
                                    .should_encode(true))
                   .template_param(new_parameter(evidence_id, key: 'evidence_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
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
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def submit_evidence(dispute_id:)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/v2/disputes/{dispute_id}/submit-evidence',
                                     'default')
                   .template_param(new_parameter(dispute_id, key: 'dispute_id')
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .auth(Single.new('global')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .convertor(ApiResponse.method(:create)))
        .execute
    end
  end
end
