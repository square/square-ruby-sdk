require_relative './helpers'
require_relative './integration_test_base'

class OrdersTest < IntegrationTestBase
  def setup
    setup_class
    @location_id = get_default_location_id(@client)

    # Create initial order for testing
    order_response = @client.orders.create(
      idempotency_key: new_test_uuid,
      order: Square::Types::Order.new(
        location_id: @location_id,
        line_items: [
          Square::Types::OrderLineItem.new(
            name: "New Item",
            quantity: "1",
            base_price_money: Square::Types::Money.new(
              amount: 100,
              currency: "USD"
            )
          )
        ]
      )
    )

    @order_id = order_response.order.id
    @line_item_uid = order_response.order.line_items.first.uid
  end

  def test_should_create_order
    response = @client.orders.create(
      idempotency_key: new_test_uuid,
      order: Square::Types::Order.new(
        location_id: @location_id,
        line_items: [
          Square::Types::OrderLineItem.new(
            name: "New Item",
            quantity: "1",
            base_price_money: Square::Types::Money.new(
              amount: 100,
              currency: "USD"
            )
          )
        ]
      )
    )

    refute_nil response.order
    assert_equal @location_id, response.order.location_id
    assert_equal "New Item", response.order.line_items.first.name
  end

  def test_should_batch_retrieve_orders
    response = @client.orders.batch_get(order_ids: [@order_id])

    refute_nil response.orders
    assert_equal @order_id, response.orders.first.id
  end

  def test_should_search_orders
    response = @client.orders.search(
      limit: 1,
      location_ids: [@location_id]
    )

    refute_nil response.orders
    assert response.orders.length > 0
  end

  def test_should_update_order
    response = @client.orders.update(
      order_id: @order_id,
      idempotency_key: new_test_uuid,
      order: Square::Types::Order.new(
        version: 1,
        location_id: @location_id,
        line_items: [
          Square::Types::OrderLineItem.new(
            name: "Updated Item",
            quantity: "1",
            base_price_money: Square::Types::Money.new(
              amount: 0,
              currency: "USD"
            ),
            note: nil
          )
        ]
      ),
      fields_to_clear: ["line_items[#{@line_item_uid}]"]
    )

    refute_nil response.order
    assert_equal @order_id, response.order.id
    assert_equal "Updated Item", response.order.line_items.first.name
  end

  def test_should_pay_order
    response = @client.orders.pay(
      order_id: @order_id,
      idempotency_key: new_test_uuid,
      order_version: 2,
      payment_ids: []
    )

    refute_nil response.order
    assert_equal @order_id, response.order.id
  end

  def test_should_calculate_order
    response = @client.orders.calculate(
      order: Square::Types::Order.new(
        location_id: @location_id,
        line_items: [
          Square::Types::OrderLineItem.new(
            name: "New Item",
            quantity: "1",
            base_price_money: Square::Types::Money.new(
              amount: 100,
              currency: "USD"
            )
          )
        ]
      )
    )

    refute_nil response.order
    refute_nil response.order.total_money
  end
end
