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
    _create_resp = client.customers.groups.create(request: _create_request.to_h)
    refute_nil _create_resp
    assert_equal _create_resp.class, Square::Types::CreateCustomerGroupResponse
    refute_nil _create_resp.group
  end

  def delete_test_customer_group(group_id)
    _delete_request = Square::Customers::Groups::Types::DeleteGroupsRequest.new(
      group_id: group_id
    )
    _delete_resp = client.customers.groups.delete(request: _delete_request.to_h)
    refute_nil _delete_resp
    assert_equal _delete_resp.class, Square::Types::DeleteCustomerGroupResponse
  end

  describe "#create and list" do
    it "should create and list a customer group" do
      skip "Skipping for now."
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
      assert_equal list_response.class, Square::Types::ListCustomerGroupsResponse
      refute_nil list_response.groups
      assert list_response.groups.length > 0

      puts "list_response #{list_response.to_h}" if verbose?

      # Cleanup
      delete_test_customer_group(response.group.id)
    end
  end

  describe "#get" do
    it "should retrieve a customer group" do
      skip "Skipping for now."
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
      skip "Skipping for now."
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
      skip "Skipping for now."
      create_response = create_test_customer_group

      _request = { group_id: create_response.group.id }

      puts "request #{_request.to_h}" if verbose?

      delete_test_customer_group(create_response.group.id)
    end
  end

  describe "#get with non-existent group" do
    it "should handle error when retrieving non-existent group" do
      skip "Skipping for now."
      non_existent_id = "non-existent-id"

      _request = { group_id: non_existent_id }

      puts "request #{_request.to_h}" if verbose?

      assert_raises(Square::SquareError) do
        client.customers.groups.get(group_id: non_existent_id)
      end
    end
  end

  describe "#create with invalid data" do
    it "should handle error when creating group with invalid data" do
      skip "Skipping for now."
      _request = {
        idempotency_key: SecureRandom.uuid,
        group: {
          name: "" # Empty name should be invalid
        }
      }

      puts "request #{_request.to_h}" if verbose?

      assert_raises(Square::SquareError) do
        client.customers.groups.create(request: _request.to_h)
      end
    end
  end
end