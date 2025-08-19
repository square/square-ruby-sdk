
module Square
  module Disputes
    module Evidence
      class Client
        # @return [Square::Disputes::Evidence::Client]
        def initialize(client:)
          @client = client
        end

        # Returns a list of evidence associated with a dispute.
        #
        # @return [Square::Types::ListDisputeEvidenceResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListDisputeEvidenceResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Returns the metadata for the evidence specified in the request URL path.
        # 
        # You must maintain a copy of any evidence uploaded if you want to reference it later. Evidence cannot be downloaded after you upload it.
        #
        # @return [Square::Types::GetDisputeEvidenceResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetDisputeEvidenceResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Removes specified evidence from a dispute.
        # Square does not send the bank any evidence that is removed.
        #
        # @return [Square::Types::DeleteDisputeEvidenceResponse]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteDisputeEvidenceResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
