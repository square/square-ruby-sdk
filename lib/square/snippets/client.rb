
module Square
    module Snippets
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::Snippets::Client]
            def initialize(client)
                @client = client
            end

            # Retrieves your snippet from a Square Online site. A site can contain snippets from multiple snippet applications, but you can retrieve only the snippet that was added by your application.
            # 
            # You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.
            # 
            # 
            # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
            #
            # @return [Square::GetSnippetResponse]
            def get(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::GetSnippetResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Adds a snippet to a Square Online site or updates the existing snippet on the site. 
            # The snippet code is appended to the end of the `head` element on every page of the site, except checkout pages. A snippet application can add one snippet to a given site. 
            # 
            # You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.
            # 
            # 
            # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
            #
            # @return [Square::UpsertSnippetResponse]
            def upsert(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::UpsertSnippetResponse.load(_response.body)

                else
                    raise _response.body
                end
            end

            # Removes your snippet from a Square Online site.
            # 
            # You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.
            # 
            # 
            # __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
            #
            # @return [Square::DeleteSnippetResponse]
            def delete(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::DeleteSnippetResponse.load(_response.body)

                else
                    raise _response.body
                end
            end
        end
    end
end
