module Square
  # CardsApi
  class CardsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Retrieves a list of cards owned by the account making the request.
    # A max of 25 cards will be returned.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # a previous call to this endpoint. Provide this to retrieve the next set of
    # results for your original query.  See
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # for more information.
    # @param [String] customer_id Optional parameter: Limit results to cards
    # associated with the customer supplied. By default, all cards owned by the
    # merchant are returned.
    # @param [Boolean] include_disabled Optional parameter: Includes disabled
    # cards. By default, all enabled cards owned by the merchant are returned.
    # @param [String] reference_id Optional parameter: Limit results to cards
    # associated with the reference_id supplied.
    # @param [SortOrder] sort_order Optional parameter: Sorts the returned list
    # by when the card was created with the specified order. This field defaults
    # to ASC.
    # @return [ListCardsResponse Hash] response from the API call
    def list_cards(cursor: nil,
                   customer_id: nil,
                   include_disabled: false,
                   reference_id: nil,
                   sort_order: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/cards'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor,
        'customer_id' => customer_id,
        'include_disabled' => include_disabled,
        'reference_id' => reference_id,
        'sort_order' => sort_order
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

    # Adds a card on file to an existing merchant.
    # @param [CreateCardRequest] body Required parameter: An object containing
    # the fields to POST for the request.  See the corresponding object
    # definition for field details.
    # @return [CreateCardResponse Hash] response from the API call
    def create_card(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/cards'
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

    # Retrieves details for a specific Card.
    # @param [String] card_id Required parameter: Unique ID for the desired
    # Card.
    # @return [RetrieveCardResponse Hash] response from the API call
    def retrieve_card(card_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/cards/{card_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'card_id' => { 'value' => card_id, 'encode' => true }
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

    # Disables the card, preventing any further updates or charges.
    # Disabling an already disabled card is allowed but has no effect.
    # @param [String] card_id Required parameter: Unique ID for the desired
    # Card.
    # @return [DisableCardResponse Hash] response from the API call
    def disable_card(card_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/cards/{card_id}/disable'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'card_id' => { 'value' => card_id, 'encode' => true }
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
