# frozen_string_literal: true

require_relative "../../../test_helper"

describe Square::Customers::Groups::Client do
  def create_test_customer_group
    client.customers.groups.create(
      idempotency_key: SecureRandom.uuid,
      group: {
        name: "Default-#{SecureRandom.uuid}"
      }
    )
  end

  def delete_test_customer_group(group_id)
    client.customers.groups.delete(group_id: group_id)
  end

  describe "#create and list" do
    it "should create and list a customer group" do
      # create
      _create_request = {
        idempotency_key: SecureRandom.uuid,
        group: {
          name: "Default-#{SecureRandom.uuid}"
        }
      }

      puts "create_request #{_create_request}" if verbose?

      response = create_test_customer_group
      refute_nil response.group
      refute_nil response.group.name

      puts "create_response #{response.to_h}" if verbose?

      # list
      _list_request = {}

      puts "list_request #{_list_request}" if verbose?

      list_response = client.customers.groups.list
      refute_nil list_response.data
      assert list_response.data.length > 0

      puts "list_response #{list_response.to_h}" if verbose?

      # Cleanup
      delete_test_customer_group(response.group.id)
    end
  end

  describe "#get" do
    it "should retrieve a customer group" do
      create_response = create_test_customer_group

      _request = { group_id: create_response.group.id }

      puts "request #{_request}" if verbose?

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

      puts "request #{_request}" if verbose?

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
      create_response = create_test_customer_group

      _request = { group_id: create_response.group.id }

      puts "request #{_request}" if verbose?

      delete_response = delete_test_customer_group(create_response.group.id)
      refute_nil delete_response
      assert_nil delete_response.errors

      puts "response #{delete_response.to_h}" if verbose?
    end
  end

  describe "#get with non-existent group" do
    it "should handle error when retrieving non-existent group" do
      non_existent_id = "non-existent-id"

      _request = { group_id: non_existent_id }

      puts "request #{_request}" if verbose?

      assert_raises(Square::SquareError) do
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

      puts "request #{_request}" if verbose?

      assert_raises(Square::SquareError) do
        client.customers.groups.create(
          idempotency_key: _request[:idempotency_key],
          group: _request[:group]
        )
      end
    end
  end
end