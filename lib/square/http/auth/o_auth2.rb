module Square
  # Utility class for OAuth 2 authorization and token management.
  class OAuth2 < CoreLibrary::HeaderAuth
    # Display error message on occurrence of authentication failure.
    # @returns [String] The oAuth error message.
    def error_message
      'BearerAuth: access_token is undefined.'
    end

    # Initialization constructor.
    def initialize(access_token)
      auth_params = {}
      @_access_token = access_token
      auth_params['Authorization'] = "Bearer #{@_access_token}" unless @_access_token.nil?

      super auth_params
    end
  end
end
