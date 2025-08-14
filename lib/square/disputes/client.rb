
module Square
    module Disputes
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::Disputes::Client]
            def initialize(client)
                @client = client
            end

            # Returns a list of disputes associated with a particular account.
            #
            # @return [Square::ListDisputesResponse]
            def list(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::ListDisputesResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Returns details about a specific dispute.
            #
            # @return [Square::GetDisputeResponse]
            def get(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::GetDisputeResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Accepts the loss on a dispute. Square returns the disputed amount to the cardholder and
            # updates the dispute state to ACCEPTED.
            # 
            # Square debits the disputed amount from the seller’s Square account. If the Square account
            # does not have sufficient funds, Square debits the associated bank account.
            #
            # @return [Square::AcceptDisputeResponse]
            def accept(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::AcceptDisputeResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Uploads a file to use as evidence in a dispute challenge. The endpoint accepts HTTP
            # multipart/form-data file uploads in HEIC, HEIF, JPEG, PDF, PNG, and TIFF formats.
            #
            # @return [Square::CreateDisputeEvidenceFileResponse]
            def create_evidence_file(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::CreateDisputeEvidenceFileResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Uploads text to use as evidence for a dispute challenge.
            #
            # @return [Square::CreateDisputeEvidenceTextResponse]
            def create_evidence_text(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::CreateDisputeEvidenceTextResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Submits evidence to the cardholder's bank.
            # 
            # The evidence submitted by this endpoint includes evidence uploaded
            # using the [CreateDisputeEvidenceFile](api-endpoint:Disputes-CreateDisputeEvidenceFile) and
            # [CreateDisputeEvidenceText](api-endpoint:Disputes-CreateDisputeEvidenceText) endpoints and
            # evidence automatically provided by Square, when available. Evidence cannot be removed from
            # a dispute after submission.
            #
            # @return [Square::SubmitEvidenceResponse]
            def submit_evidence(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::SubmitEvidenceResponse.load(_response.body)

                else
                    raise _response.body
            end
        end
    end
end
