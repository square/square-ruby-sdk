

require_relative 'api_test_base'

class CatalogApiTests < ApiTestBase
  # Called only once for the class before any test has executed
  def setup
    setup_class
    @controller = @client.catalog
    @response_catcher = @controller.http_call_back
  end

  # Returns information about the Square Catalog API, such as batch size
  #limits for `BatchUpsertCatalogObjects`.
  def test_test_catalog_info()

    # Perform the API call through the SDK function
    result = @controller.catalog_info()

    # Test response code
    assert_equal(200, @response_catcher.response.status_code)

    # Test headers
    expected_headers = {}
    expected_headers['content-type'] = 'application/json'

    assert(ComparisonHelper.match_headers(expected_headers, @response_catcher.response.headers))
  end

  # Returns a list of [CatalogObject](#type-catalogobject)s that includes
  #all objects of a set of desired types (for example, all [CatalogItem](#type-catalogitem)
  #and [CatalogTax](#type-catalogtax) objects) in the catalog. The `types` parameter
  #is specified as a comma-separated list of valid [CatalogObject](#type-catalogobject) types:
  #`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`.
  #
  #__Important:__ ListCatalog does not return deleted catalog items. To retrieve
  #deleted catalog items, use SearchCatalogObjects and set `include_deleted_objects`
  #to `true`.
  def test_test_list_catalog()
    # Parameters for the API call
    cursor = nil
    types = nil

    # Perform the API call through the SDK function
    result = @controller.list_catalog(cursor: cursor, types: types)

    # Test response code
    assert_equal(200, @response_catcher.response.status_code)

    # Test headers
    expected_headers = {}
    expected_headers['content-type'] = 'application/json'

    assert(ComparisonHelper.match_headers(expected_headers, @response_catcher.response.headers))
  end

end
