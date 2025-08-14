require_relative 'helpers'
require_relative 'integration_test_base'

class CatalogSerialTest < IntegrationTestBase
  MAX_CATALOG_PAGE_SIZE = 100
  MAX_RETRIES_CATALOG = 5
  MAX_TIMEOUT = 120

  def setup
    setup_class
    @catalog_modifier_list_id = nil
    @catalog_modifier_id = nil
    @catalog_tax_id = nil
  end

  def sleep(seconds)
    sleep(seconds)
  end

  def delete_all_catalog_objects(client)
    catalog_objects_resp = client.catalog.list
    object_ids = []
    
    catalog_objects_resp.data.each do |catalog_object|
      next unless catalog_object.id
      
      object_ids << catalog_object.id
      
      next unless catalog_object.respond_to?(:item_data)
      
      variation = catalog_object.item_data&.variations&.first
      next unless variation&.id
      
      object_ids << variation.id
    end
    
    client.catalog.batch_delete(object_ids: object_ids)
  end

  def test_bulk_create_and_iterate_through_paginated_catalog_objects
    delete_all_catalog_objects(@client)
    sleep(2) # Wait after deletion

    # Setup: Create 200 catalog objects with 1 CatalogItemVariation each
    catalog_objects = Array.new(200) { create_test_catalog_item }

    # Create the catalog objects in a bulk request
    create_catalog_objects_resp = @client.catalog.batch_upsert(
      idempotency_key: new_test_uuid,
      batches: [
        {
          objects: catalog_objects
        }
      ]
    )

    assert_equal 200, create_catalog_objects_resp.objects.length
    sleep(2) # Wait after bulk creation

    # List all catalog objects
    number_of_pages = 0
    catalog_objects_resp = @client.catalog.list
    number_of_pages += 1
    assert_equal MAX_CATALOG_PAGE_SIZE, catalog_objects_resp.data.length

    while catalog_objects_resp.has_next_page?
      sleep(1) # Wait between page requests
      catalog_objects_resp = catalog_objects_resp.get_next_page
      number_of_pages += 1
    end

    assert number_of_pages > 1
    sleep(2) # Wait before cleanup

    delete_catalog_objects_resp = delete_all_catalog_objects(@client)
    assert_equal 200, delete_catalog_objects_resp.deleted_object_ids.length
  end

  def test_upload_catalog_image
    # Add retry logic for the image upload
    max_retries = 5
    last_error = nil
    
    max_retries.times do |attempt|
      begin
        # If this isn't the first attempt, wait before retrying
        if attempt > 0
          puts "Attempt #{attempt + 1} for image upload..."
          # Increase wait time between retries exponentially
          sleep(2 ** attempt * 5)
        end

        puts "Starting image upload attempt #{attempt + 1}"

        # Setup: Load a test image file
        image_file = get_test_file
        puts 'Test file loaded'

        # Setup: Create a catalog object to associate the image with
        catalog_object = create_test_catalog_item
        
        # Add delay before catalog creation
        sleep(3)
        puts 'Creating catalog object...'
        
        create_catalog_resp = @client.catalog.batch_upsert(
          idempotency_key: new_test_uuid,
          batches: [
            {
              objects: [catalog_object]
            }
          ]
        )

        puts 'Catalog object created'
        assert_equal 1, create_catalog_resp.objects.length
        created_catalog_object = create_catalog_resp.objects.first
        assert created_catalog_object

        # Add delay before image upload
        sleep(5)
        puts 'Uploading image...'

        # Create a new catalog image
        image_name = "Test Image #{new_test_uuid}"
        create_catalog_image_resp = @client.catalog.images.create(
          image_file: image_file,
          request: {
            idempotency_key: new_test_uuid,
            object_id: created_catalog_object.id,
            image: {
              type: "IMAGE",
              id: new_test_square_temp_id,
              image_data: {
                name: image_name
              }
            }
          }
        )

        puts 'Image uploaded successfully'
        assert create_catalog_image_resp.image

        # Add delay before cleanup
        sleep(3)
        puts 'Starting cleanup...'

        # Cleanup: Delete the created catalog object and image
        @client.catalog.batch_delete(
          object_ids: [created_catalog_object.id, create_catalog_image_resp.image.id]
        )

        puts 'Cleanup completed'
        # If we get here, the test succeeded, so break out of retry loop
        return

      rescue => error
        last_error = error
        puts "Attempt #{attempt + 1} failed with error: #{error}"
        # If this was the last attempt, the error will be thrown below
      end
    end

    # If we get here, all retries failed
    puts 'All image upload attempts failed'
    raise last_error
  end

  def test_upsert_catalog_object
    coffee = create_test_catalog_item(
      name: "Coffee",
      description: "Strong coffee",
      abbreviation: "C",
      price: 100,
      variation_name: "Colombian Fair Trade"
    )

    sleep(2) # Wait before upsert

    response = @client.catalog.object.upsert(
      object: coffee,
      idempotency_key: new_test_uuid
    )
    
    catalog_object = response.catalog_object

    assert response
    assert catalog_object
    assert_equal "ITEM", catalog_object.type
    assert_equal 1, catalog_object.item_data.variations.length

    variation = catalog_object.item_data.variations.first
    assert_equal "Colombian Fair Trade", variation.item_variation_data.name
  end

  def test_catalog_info
    sleep(2) # Wait before info request
    response = @client.catalog.info
    assert response
  end

  def test_list_catalog
    sleep(2) # Wait before list request
    response = @client.catalog.list
    assert response
  end

  def test_search_catalog_objects
    sleep(2) # Wait before search
    response = @client.catalog.search(limit: 1)
    assert response
  end

  def test_search_catalog_items
    sleep(2) # Wait before search items
    response = @client.catalog.search_items(limit: 1)
    assert response
  end

  def test_batch_upsert_catalog_objects
    sleep(2) # Wait before batch upsert

    modifier = Square::Types::CatalogObjectModifier.new(
      type: "MODIFIER",
      id: "#temp-modifier-id",
      modifier_data: Square::Types::CatalogModifier.new(
        name: "Limited Time Only Price",
        price_money: Square::Types::Money.new(
          amount: 200,
          currency: "USD"
        )
      )
    )

    modifier_list = Square::Types::CatalogObjectModifierList.new(
      type: "MODIFIER_LIST",
      id: "#temp-modifier-list-id",
      modifier_list_data: Square::Types::CatalogModifierList.new(
        name: "Special weekend deals",
        modifiers: [modifier]
      )
    )

    tax = Square::Types::CatalogObjectTax.new(
      type: "TAX",
      id: "#temp-tax-id",
      tax_data: Square::Types::CatalogTax.new(
        name: "Online only Tax",
        calculation_phase: "TAX_SUBTOTAL_PHASE",
        inclusion_type: "ADDITIVE",
        percentage: "5.0",
        applies_to_custom_amounts: true,
        enabled: true
      )
    )

    response = @client.catalog.batch_upsert(
      idempotency_key: new_test_uuid,
      batches: [
        {
          objects: [tax, modifier_list]
        }
      ]
    )

    assert response
    assert_equal 2, response.objects.length

    # Store IDs for later use
    response.id_mappings&.each do |mapping|
      case mapping.client_object_id
      when "#temp-tax-id"
        @catalog_tax_id = mapping.object_id
      when "#temp-modifier-id"
        @catalog_modifier_id = mapping.object_id
      when "#temp-modifier-list-id"
        @catalog_modifier_list_id = mapping.object_id
      end
    end
  end

  def test_retrieve_catalog_object
    sleep(2) # Wait before test start

    # First create a catalog object
    coffee = create_test_catalog_item
    create_resp = @client.catalog.object.upsert(
      object: coffee,
      idempotency_key: new_test_uuid
    )

    sleep(2) # Wait before retrieve

    # Then retrieve it
    response = @client.catalog.object.get(object_id: create_resp.catalog_object.id)
    assert response.object
    assert_equal create_resp.catalog_object.id, response.object.id

    sleep(2) # Wait before cleanup

    # Cleanup
    @client.catalog.object.delete(object_id: create_resp.catalog_object.id)
  end

  def test_batch_retrieve_catalog_objects
    sleep(2) # Wait before batch retrieve

    # Use the IDs created in the batch upsert test
    response = @client.catalog.batch_get(
      object_ids: [@catalog_modifier_id, @catalog_modifier_list_id, @catalog_tax_id]
    )

    assert response.objects
    assert_equal 3, response.objects.length
    assert_equal [@catalog_modifier_id, @catalog_modifier_list_id, @catalog_tax_id].sort,
                 response.objects.map(&:id).sort
  end

  def test_update_item_taxes
    sleep(2) # Wait before test start

    # First create a test item
    item = create_test_catalog_item
    create_resp = @client.catalog.object.upsert(
      object: item,
      idempotency_key: new_test_uuid
    )

    sleep(2) # Wait before update

    response = @client.catalog.update_item_taxes(
      item_ids: [create_resp.catalog_object.id],
      taxes_to_enable: [@catalog_tax_id]
    )

    assert response.updated_at

    sleep(2) # Wait before cleanup

    # Cleanup
    @client.catalog.object.delete(object_id: create_resp.catalog_object.id)
  end

  def test_update_item_modifier_lists
    sleep(2) # Wait before test start

    # First create a test item
    item = create_test_catalog_item
    create_resp = @client.catalog.object.upsert(
      object: item,
      idempotency_key: new_test_uuid
    )

    sleep(2) # Wait before update

    response = @client.catalog.update_item_modifier_lists(
      item_ids: [create_resp.catalog_object.id],
      modifier_lists_to_enable: [@catalog_modifier_list_id]
    )

    assert response.updated_at

    sleep(2) # Wait before cleanup

    # Cleanup
    @client.catalog.object.delete(object_id: create_resp.catalog_object.id)
  end
end