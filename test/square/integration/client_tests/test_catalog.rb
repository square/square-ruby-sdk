# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Catalog::Client do
  MAX_CATALOG_PAGE_SIZE = 100
  MAX_RETRIES_CATALOG = 5
  MAX_TIMEOUT = 120

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

  def create_test_catalog_item(name: "Test Item #{SecureRandom.uuid}", description: "Test Description", abbreviation: "TI", price: 100, variation_name: "Regular")
    {
      type: "ITEM",
      id: "##{SecureRandom.uuid}",
      present_at_all_locations: true,
      item_data: {
        name: name,
        description: description,
        abbreviation: abbreviation,
        variations: [
          {
            type: "ITEM_VARIATION",
            id: "##{SecureRandom.uuid}",
            present_at_all_locations: true,
            item_variation_data: {
              name: variation_name,
              track_inventory: false,
              pricing_type: "FIXED_PRICING",
              price_money: {
                amount: price,
                currency: "USD"
              }
            }
          }
        ]
      }
    }
  end

  def get_test_file
    # Return the actual test image file path
    "../testdata/image.jpeg"
  end

  before do
    @catalog_modifier_list_id = nil
    @catalog_modifier_id = nil
    @catalog_tax_id = nil
  end

  describe "#batch_upsert" do
    it "creates multiple catalog objects" do
      skip "Skipping for now."
      _request = Square::Catalog::Types::BatchUpsertCatalogObjectsRequest.new(
        idempotency_key: SecureRandom.uuid,
        batches: [
          {
            objects: [
              {
                type: "ITEM",
                id: "##{SecureRandom.uuid}",
                present_at_all_locations: true,
                item_data: {
                  name: "Coffee",
                  description: "Strong coffee",
                  abbreviation: "C",
                  variations: [
                    {
                      type: "ITEM_VARIATION",
                      id: "##{SecureRandom.uuid}",
                      present_at_all_locations: true,
                      item_variation_data: {
                        name: "Kona Coffee",
                        track_inventory: false,
                        pricing_type: "FIXED_PRICING",
                        price_money: {
                          amount: 1000,
                          currency: "USD"
                        }
                      }
                    }
                  ]
                }
              },
              {
                type: "ITEM",
                id: "##{SecureRandom.uuid}",
                present_at_all_locations: true,
                item_data: {
                  name: "Tea",
                  description: "Strong tea",
                  abbreviation: "T",
                  variations: [
                    {
                      type: "ITEM_VARIATION",
                      id: "##{SecureRandom.uuid}",
                      present_at_all_locations: true,
                      item_variation_data: {
                        name: "Gunpowder Green",
                        track_inventory: false,
                        pricing_type: "FIXED_PRICING",
                        price_money: {
                          amount: 2000,
                          currency: "USD"
                        }
                      }
                    }
                  ]
                }
              }
            ]
          }
        ]
      )

      puts "request #{_request.to_h}" if verbose?

      response = client.catalog.batch_upsert(request: _request.to_h)
      refute_nil response

      puts "response #{response.to_h}" if verbose?
    end

    it "batch upsert catalog objects with modifiers and taxes" do
      skip "Skipping for now."
      sleep(2) # Wait before batch upsert

      modifier = {
        type: "MODIFIER",
        id: "#temp-modifier-id",
        modifier_data: {
          name: "Limited Time Only Price",
          price_money: {
            amount: 200,
            currency: "USD"
          }
        }
      }

      modifier_list = {
        type: "MODIFIER_LIST",
        id: "#temp-modifier-list-id",
        modifier_list_data: {
          name: "Special weekend deals",
          modifiers: [modifier]
        }
      }

      tax = {
        type: "TAX",
        id: "#temp-tax-id",
        tax_data: {
          name: "Online only Tax",
          calculation_phase: "TAX_SUBTOTAL_PHASE",
          inclusion_type: "ADDITIVE",
          percentage: "5.0",
          applies_to_custom_amounts: true,
          enabled: true
        }
      }

      _request = {
        idempotency_key: SecureRandom.uuid,
        batches: [
          {
            objects: [tax, modifier_list]
          }
        ]
      }

      puts "request #{_request.keys}" if verbose?

      response = client.catalog.batch_upsert(
        idempotency_key: _request[:idempotency_key],
        batches: _request[:batches]
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

      puts "response objects_count=#{response.objects.length}" if verbose?
    end
  end

  describe "#bulk operations and pagination" do
    it "bulk create and iterate through paginated catalog objects" do
      skip "Skipping for now."
      delete_all_catalog_objects(client)
      sleep(2) # Wait after deletion

      # Setup: Create 200 catalog objects with 1 CatalogItemVariation each
      catalog_objects = Array.new(200) { create_test_catalog_item }

      _request = {
        idempotency_key: SecureRandom.uuid,
        batches: [
          {
            objects: catalog_objects
          }
        ]
      }

      puts "request #{_request.keys}" if verbose?

      # Create the catalog objects in a bulk request
      create_catalog_objects_resp = client.catalog.batch_upsert(
        idempotency_key: _request[:idempotency_key],
        batches: _request[:batches]
      )
      assert_equal 200, create_catalog_objects_resp.objects.length
      sleep(2) # Wait after bulk creation

      puts "create_response objects_count=#{create_catalog_objects_resp.objects.length}" if verbose?

      # List all catalog objects
      number_of_pages = 0
      catalog_objects_resp = client.catalog.list
      number_of_pages += 1
      assert_equal MAX_CATALOG_PAGE_SIZE, catalog_objects_resp.data.length

      while catalog_objects_resp.has_next_page?
        sleep(1) # Wait between page requests
        catalog_objects_resp = catalog_objects_resp.get_next_page
        number_of_pages += 1
      end

      assert number_of_pages > 1
      sleep(2) # Wait before cleanup

      delete_catalog_objects_resp = delete_all_catalog_objects(client)
      assert_equal 200, delete_catalog_objects_resp.deleted_object_ids.length

      puts "delete_response deleted_count=#{delete_catalog_objects_resp.deleted_object_ids.length}" if verbose?
    end
  end

  describe "#images" do
    it "upload catalog image" do
      skip "Skipping for now."
      # Add retry logic for the image upload
      max_retries = 5
      last_error = nil
      
      max_retries.times do |attempt|
        begin
          # If this isn't the first attempt, wait before retrying
          if attempt > 0
            puts "Attempt #{attempt + 1} for image upload..." if verbose?
            # Increase wait time between retries exponentially
            sleep(2 ** attempt * 5)
          end

          puts "Starting image upload attempt #{attempt + 1}" if verbose?

          # Setup: Load a test image file
          image_file = get_test_file
          puts 'Test file loaded' if verbose?

          # Setup: Create a catalog object to associate the image with
          catalog_object = create_test_catalog_item
          
          # Add delay before catalog creation
          sleep(3)
          puts 'Creating catalog object...' if verbose?

          _create_request = {
            idempotency_key: SecureRandom.uuid,
            batches: [
              {
                objects: [catalog_object]
              }
            ]
          }

          puts "create_catalog_request #{_create_request.keys}" if verbose?
          
          create_catalog_resp = client.catalog.batch_upsert(
            idempotency_key: _create_request[:idempotency_key],
            batches: _create_request[:batches]
          )

          puts 'Catalog object created' if verbose?
          assert_equal 1, create_catalog_resp.objects.length
          created_catalog_object = create_catalog_resp.objects.first
          assert created_catalog_object

          puts "create_catalog_response object_id=#{created_catalog_object.id}" if verbose?

          # Add delay before image upload
          sleep(5)
          puts 'Uploading image...' if verbose?

          # Create a new catalog image
          image_name = "Test Image #{SecureRandom.uuid}"
          
          _image_request = {
            image_file: image_file,
            request: {
              idempotency_key: SecureRandom.uuid,
              object_id: created_catalog_object.id,
              image: {
                type: "IMAGE",
                id: "##{SecureRandom.uuid}",
                image_data: {
                  name: image_name
                }
              }
            }
          }

          puts "image_upload_request #{_image_request[:request]}" if verbose?

          create_catalog_image_resp = client.catalog.images.create(
            image_file: _image_request[:image_file],
            request: _image_request[:request]
          )

          puts 'Image uploaded successfully' if verbose?
          assert create_catalog_image_resp.image

          puts "image_upload_response image_id=#{create_catalog_image_resp.image.id}" if verbose?

          # Add delay before cleanup
          sleep(3)
          puts 'Starting cleanup...' if verbose?

          # Cleanup: Delete the created catalog object and image
          client.catalog.batch_delete(
            object_ids: [created_catalog_object.id, create_catalog_image_resp.image.id]
          )

          puts 'Cleanup completed' if verbose?
          # If we get here, the test succeeded, so break out of retry loop
          return

        rescue => error
          last_error = error
          puts "Attempt #{attempt + 1} failed with error: #{error}" if verbose?
          # If this was the last attempt, the error will be thrown below
        end
      end

      # If we get here, all retries failed
      puts 'All image upload attempts failed' if verbose?
      raise last_error
    end
  end

  describe "#info" do
    it "catalog info" do
      skip "Skipping for now."
      sleep(2) # Wait before info request
      
      _request = {}

      puts "request #{_request}" if verbose?

      response = client.catalog.info
      assert response

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#list" do
    it "list catalog" do
      skip "Skipping for now."
      sleep(2) # Wait before list request
      
      _request = {}

      puts "request #{_request}" if verbose?

      response = client.catalog.list
      assert response

      puts "response items_count=#{response.data&.length || 0}" if verbose?
    end
  end

  describe "#search" do
    it "search catalog objects" do
      skip "Skipping for now."
      sleep(2) # Wait before search
      
      _request = { limit: 1 }

      puts "request #{_request}" if verbose?

      response = client.catalog.search(limit: 1)
      assert response

      puts "response items_count=#{response.objects&.length || 0}" if verbose?
    end
  end

  describe "#search_items" do
    it "search catalog items" do
      skip "Skipping for now."
      sleep(2) # Wait before search items
      
      _request = { limit: 1 }

      puts "request #{_request}" if verbose?

      response = client.catalog.search_items(limit: 1)
      assert response

      puts "response items_count=#{response.items&.length || 0}" if verbose?
    end
  end

  describe "#batch_get" do
    it "batch retrieve catalog objects" do
      skip "Skipping for now."
      sleep(2) # Wait before batch retrieve

      # Use the IDs created in the batch upsert test
      _request = {
        object_ids: [@catalog_modifier_id, @catalog_modifier_list_id, @catalog_tax_id]
      }

      puts "request #{_request}" if verbose?

      response = client.catalog.batch_get(
        object_ids: _request[:object_ids]
      )

      assert response.objects
      assert_equal 3, response.objects.length
      assert_equal [@catalog_modifier_id, @catalog_modifier_list_id, @catalog_tax_id].sort,
                   response.objects.map(&:id).sort

      puts "response objects_count=#{response.objects.length}" if verbose?
    end
  end

  describe "#update_item_taxes" do
    it "update item taxes" do
      skip "Skipping for now."
      sleep(2) # Wait before test start

      # First create a test item
      item = create_test_catalog_item
      create_resp = client.catalog.object.upsert(
        object: item,
        idempotency_key: SecureRandom.uuid
      )

      sleep(2) # Wait before update

      _request = {
        item_ids: [create_resp.catalog_object.id],
        taxes_to_enable: [@catalog_tax_id]
      }

      puts "request #{_request}" if verbose?

      response = client.catalog.update_item_taxes(
        item_ids: _request[:item_ids],
        taxes_to_enable: _request[:taxes_to_enable]
      )

      assert response.updated_at

      puts "response updated_at=#{response.updated_at}" if verbose?

      sleep(2) # Wait before cleanup

      # Cleanup
      client.catalog.object.delete(object_id: create_resp.catalog_object.id)
    end
  end

  describe "#update_item_modifier_lists" do
    it "update item modifier lists" do
      skip "Skipping for now."
      sleep(2) # Wait before test start

      # First create a test item
      item = create_test_catalog_item
      create_resp = client.catalog.object.upsert(
        object: item,
        idempotency_key: SecureRandom.uuid
      )

      sleep(2) # Wait before update

      _request = {
        item_ids: [create_resp.catalog_object.id],
        modifier_lists_to_enable: [@catalog_modifier_list_id]
      }

      puts "request #{_request}" if verbose?

      response = client.catalog.update_item_modifier_lists(
        item_ids: _request[:item_ids],
        modifier_lists_to_enable: _request[:modifier_lists_to_enable]
      )

      assert response.updated_at

      puts "response updated_at=#{response.updated_at}" if verbose?

      sleep(2) # Wait before cleanup

      # Cleanup
      client.catalog.object.delete(object_id: create_resp.catalog_object.id)
    end
  end

  describe Square::Catalog::Object::Client do
    describe "#upsert" do
      it "upserts an object" do
        skip "Skipping for now."
        _request = {
          idempotency_key: SecureRandom.uuid,
          object: {
            type: "ITEM",
            id: "##{SecureRandom.uuid}",
            present_at_all_locations: true,
            item_data: {
              name: "Coffee",
              description: "Strong coffee",
              abbreviation: "C",
              variations: [
                {
                  type: "ITEM_VARIATION",
                  id: "##{SecureRandom.uuid}",
                  present_at_all_locations: true,
                  item_variation_data: {
                    name: "Kona Coffee",
                    track_inventory: false,
                    pricing_type: "FIXED_PRICING",
                    price_money: {
                      amount: 1000,
                      currency: "USD"
                    }
                  }
                }
              ]
            }
          }
        }

        puts "request #{_request}" if verbose?

        response = client.catalog.object.upsert(request: _request)
        refute_nil response

        puts "response #{response.to_h}" if verbose?
      end

      it "upsert catalog object with custom data" do
        skip "Skipping for now."
        coffee = create_test_catalog_item(
          name: "Coffee",
          description: "Strong coffee",
          abbreviation: "C",
          price: 100,
          variation_name: "Colombian Fair Trade"
        )

        sleep(2) # Wait before upsert

        _request = {
          object: coffee,
          idempotency_key: SecureRandom.uuid
        }

        puts "request #{_request.keys}" if verbose?

        response = client.catalog.object.upsert(
          object: _request[:object],
          idempotency_key: _request[:idempotency_key]
        )
        
        catalog_object = response.catalog_object

        assert response
        assert catalog_object
        assert_equal "ITEM", catalog_object.type
        assert_equal 1, catalog_object.item_data.variations.length

        variation = catalog_object.item_data.variations.first
        assert_equal "Colombian Fair Trade", variation.item_variation_data.name

        puts "response object_id=#{catalog_object.id}" if verbose?
      end
    end

    describe "#get" do
      it "retrieve catalog object" do
        skip "Skipping for now."
        sleep(2) # Wait before test start

        # First create a catalog object
        coffee = create_test_catalog_item
        
        _create_request = {
          object: coffee,
          idempotency_key: SecureRandom.uuid
        }

        puts "create_request #{_create_request.keys}" if verbose?

        create_resp = client.catalog.object.upsert(
          object: _create_request[:object],
          idempotency_key: _create_request[:idempotency_key]
        )

        sleep(2) # Wait before retrieve

        _request = { object_id: create_resp.catalog_object.id }

        puts "request #{_request}" if verbose?

        # Then retrieve it
        response = client.catalog.object.get(object_id: create_resp.catalog_object.id)
        assert response.object
        assert_equal create_resp.catalog_object.id, response.object.id

        puts "response object_id=#{response.object.id}" if verbose?

        sleep(2) # Wait before cleanup

        # Cleanup
        client.catalog.object.delete(object_id: create_resp.catalog_object.id)
      end
    end
  end
end