require_relative './helpers'
require_relative './integration_test_base'

class TerminalTest < IntegrationTestBase
  def setup
    setup_class
    @sandbox_device_id = "da40d603-c2ea-4a65-8cfd-f42e36dab0c7"

    # Create terminal checkout for testing
    checkout_response = @client.terminal.checkouts.create(
      idempotency_key: new_test_uuid,
      checkout: Square::Types::TerminalCheckout.new(
        device_options: Square::Types::DeviceCheckoutOptions.new(
          device_id: @sandbox_device_id
        ),
        amount_money: Square::Types::Money.new(
          amount: 100,
          currency: "USD"
        )
      )
    )
    @checkout_id = checkout_response.checkout.id
  end

  def test_should_create_terminal_checkout
    response = @client.terminal.checkouts.create(
      idempotency_key: new_test_uuid,
      checkout: Square::Types::TerminalCheckout.new(
        device_options: Square::Types::DeviceCheckoutOptions.new(
          device_id: @sandbox_device_id
        ),
        amount_money: Square::Types::Money.new(
          amount: 100,
          currency: "USD"
        )
      )
    )

    refute_nil response.checkout
    assert_equal @sandbox_device_id, response.checkout.device_options.device_id
    assert_equal 100, response.checkout.amount_money.amount
  end

  def test_should_search_terminal_checkouts
    response = @client.terminal.checkouts.search(limit: 1)

    refute_nil response.checkouts
    assert response.checkouts.length > 0
  end

  def test_should_get_terminal_checkout
    response = @client.terminal.checkouts.get(checkout_id: @checkout_id)

    refute_nil response.checkout
    assert_equal @checkout_id, response.checkout.id
  end

  def test_should_cancel_terminal_checkout
    response = @client.terminal.checkouts.cancel(checkout_id: @checkout_id)

    refute_nil response.checkout
    assert_equal "CANCELED", response.checkout.status
  end
end
