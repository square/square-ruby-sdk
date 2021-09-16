module Square
  # GiftCardsApi
  class GiftCardsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Lists all gift cards. You can specify optional filters to retrieve
    # a subset of the gift cards.
    # @param [String] type Optional parameter: If a type is provided, gift cards
    # of this type are returned  (see [GiftCardType]($m/GiftCardType)). If no
    # type is provided, it returns gift cards of all types.
    # @param [String] state Optional parameter: If the state is provided, it
    # returns the gift cards in the specified state  (see
    # [GiftCardStatus]($m/GiftCardStatus)). Otherwise, it returns the gift cards
    # of all states.
    # @param [Integer] limit Optional parameter: If a value is provided, it
    # returns only that number of results per page. The maximum number of
    # results allowed per page is 50. The default value is 30.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this cursor to retrieve the next
    # set of results for the original query. If a cursor is not provided, it
    # returns the first page of the results.  For more information, see
    # [Pagination](https://developer.squareup.com/docs/working-with-apis/paginat
    # ion).
    # @param [String] customer_id Optional parameter: If a value is provided,
    # returns only the gift cards linked to the specified customer
    # @return [ListGiftCardsResponse Hash] response from the API call
    def list_gift_cards(type: nil,
                        state: nil,
                        limit: nil,
                        cursor: nil,
                        customer_id: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/gift-cards'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'type' => type,
        'state' => state,
        'limit' => limit,
        'cursor' => cursor,
        'customer_id' => customer_id
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

    # Creates a digital gift card or registers a physical (plastic) gift card.
    # You must activate the gift card before
    # it can be used for payment. For more information, see
    # [Selling gift
    # cards](https://developer.squareup.com/docs/gift-cards/using-gift-cards-api
    # #selling-square-gift-cards).
    # @param [CreateGiftCardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [CreateGiftCardResponse Hash] response from the API call
    def create_gift_card(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/gift-cards'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a gift card using the gift card account number (GAN).
    # @param [RetrieveGiftCardFromGANRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [RetrieveGiftCardFromGANResponse Hash] response from the API call
    def retrieve_gift_card_from_gan(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/gift-cards/from-gan'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a gift card using a nonce (a secure token) that represents the
    # gift card.
    # @param [RetrieveGiftCardFromNonceRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [RetrieveGiftCardFromNonceResponse Hash] response from the API call
    def retrieve_gift_card_from_nonce(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/gift-cards/from-nonce'
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Links a customer to a gift card
    # @param [String] gift_card_id Required parameter: The ID of the gift card
    # to link.
    # @param [LinkCustomerToGiftCardRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [LinkCustomerToGiftCardResponse Hash] response from the API call
    def link_customer_to_gift_card(gift_card_id:,
                                   body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/gift-cards/{gift_card_id}/link-customer'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'gift_card_id' => { 'value' => gift_card_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Unlinks a customer from a gift card
    # @param [String] gift_card_id Required parameter: Example:
    # @param [UnlinkCustomerFromGiftCardRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [UnlinkCustomerFromGiftCardResponse Hash] response from the API call
    def unlink_customer_from_gift_card(gift_card_id:,
                                       body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/gift-cards/{gift_card_id}/unlink-customer'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'gift_card_id' => { 'value' => gift_card_id, 'encode' => true }
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
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a gift card using its ID.
    # @param [String] id Required parameter: The ID of the gift card to
    # retrieve.
    # @return [RetrieveGiftCardResponse Hash] response from the API call
    def retrieve_gift_card(id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/gift-cards/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => { 'value' => id, 'encode' => true }
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
  end
end
