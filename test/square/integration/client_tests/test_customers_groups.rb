# frozen_string_literal: true

require "test_helper"

describe Square::Customers::Groups::Client do
  def create_test_customer_group
    _create_request = Square::Customers::Groups::Types::CreateCustomerGroupRequest.new(
      idempotency_key: SecureRandom.uuid,
      group: {
        name: "Default-#{SecureRandom.uuid}"
      }
    )
    client.customers.groups.create(**_create_request.to_h)
  end

  def delete_test_customer_group(group_id)
    _delete_request = Square::Customers::Groups::Types::DeleteGroupsRequest.new(
      group_id: group_id
    )
    client.customers.groups.delete(**_delete_request.to_h)
  end

  describe "#create and list" do
    it "should create and list a customer group" do
      # create
      _create_request = Square::Customers::Groups::Types::CreateCustomerGroupRequest.new(
        idempotency_key: SecureRandom.uuid,
        group: {
          name: "Default-#{SecureRandom.uuid}"
        }
      )

      puts "create_request #{_create_request.to_h}" if verbose?

      response = create_test_customer_group
      refute_nil response.group
      refute_nil response.group.name
      assert_equal response.class, Square::Types::CreateCustomerGroupResponse

      puts "create_response #{response.to_h}" if verbose?

      # list
      list_response = client.customers.groups.list
      refute_nil list_response
      assert_equal Square::Internal::CursorItemIterator, list_response.class
      groups = list_response.to_a
      refute_nil groups
      assert groups.length > 0

      puts "list_response #{groups}" if verbose?

      # Cleanup
      delete_test_customer_group(response.group.id)
    end
  end

  describe "#get" do
    it "should retrieve a customer group" do
      skip "Test skipped"
      create_response = create_test_customer_group

      _request = { group_id: create_response.group.id }

      puts "request #{_request.to_h}" if verbose?

      get_response = client.customers.groups.get(group_id: create_response.group.id)
      assert_equal create_response.group.name, get_response.group.name
      assert_equal create_response.group.id, get_response.group.id

      puts "response #{get_response.to_h}" if verbose?

      # Cleanup
      delete_test_customer_group(create_response.group.id)
    end
  end

  describe "#update" do
    it "should update a customer group" do
      create_response = create_test_customer_group
      new_name = "Updated-#{SecureRandom.uuid}"

      _request = {
        group_id: create_response.group.id,
        group: { name: new_name }
      }

      puts "request #{_request.to_h}" if verbose?

      update_response = client.customers.groups.update(
        group_id: create_response.group.id,
        group: { name: new_name }
      )
      assert_equal new_name, update_response.group.name

      puts "response #{update_response.to_h}" if verbose?

      # Cleanup
      delete_test_customer_group(create_response.group.id)
    end
  end

  describe "#delete" do
    it "should delete a customer group" do
      skip "Test skipped"
      create_response = create_test_customer_group

      _request = { group_id: create_response.group.id }

      puts "request #{_request.to_h}" if verbose?

      delete_test_customer_group(create_response.group.id)
    end
  end

  describe "#get with non-existent group" do
    it "should handle error when retrieving non-existent group" do
      non_existent_id = "non-existent-id"

      _request = { group_id: non_existent_id }

      puts "request #{_request.to_h}" if verbose?

      assert_raises(StandardError) do
        client.customers.groups.get(group_id: non_existent_id)
      end
    end
  end

  describe "#create with invalid data" do
    it "should handle error when creating group with invalid data" do
      _request = {
        idempotency_key: SecureRandom.uuid,
        group: {
          name: "" # Empty name should be invalid
        }
      }

      puts "request #{_request.to_h}" if verbose?

      assert_raises(StandardError) do
        client.customers.groups.create(**_request.to_h)
      end
    end
  end
end