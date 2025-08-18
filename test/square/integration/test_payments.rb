require_relative 'helpers'
require_relative 'integration_test_base'

class PaymentsTest < IntegrationTestBase
  def setup
    setup_class
    @location_id = get_default_location_id(@client)

    # Create initial payment for testing
    payment_response = @client.payments.create(
      source_id: "cnon:card-nonce-ok",
      idempotency_key: new_test_uuid,
      amount_money: Square::Types::Money.new(
        amount: 200,
        currency: "USD"
      ),
      app_fee_money: Square::Types::Money.new(
        amount: 10,
        currency: "USD"
      ),
      autocomplete: false
    )
    @payment_id = payment_response.payment.id
  end

  def test_should_list_payments
    response = @client.payments.list

    refute_nil response.data
    assert response.data.length > 0
  end

  def test_should_create_payment
    response = @client.payments.create(
      source_id: "cnon:card-nonce-ok",
      idempotency_key: new_test_uuid,
      amount_money: Square::Types::Money.new(
        amount: 200,
        currency: "USD"
      ),
      app_fee_money: Square::Types::Money.new(
        amount: 10,
        currency: "USD"
      ),
      autocomplete: true
    )

    refute_nil response.payment
    assert_equal 10, response.payment.app_fee_money.amount
    assert_equal "USD", response.payment.app_fee_money.currency
    assert_equal 200, response.payment.amount_money.amount
    assert_equal "USD", response.payment.amount_money.currency
  end

  def test_should_get_payment
    response = @client.payments.get(payment_id: @payment_id)

    refute_nil response.payment
    assert_equal @payment_id, response.payment.id
  end

  def test_should_cancel_payment
    response = @client.payments.cancel(payment_id: @payment_id)

    refute_nil response.payment
    assert_equal @payment_id, response.payment.id
  end

  def test_should_cancel_payment_by_idempotency_key
    idempotency_key = new_test_uuid

    # Create payment to cancel
    @client.payments.create(
      source_id: "cnon:card-nonce-ok",
      idempotency_key: idempotency_key,
      amount_money: Square::Types::Money.new(
        amount: 200,
        currency: "USD"
      ),
      app_fee_money: Square::Types::Money.new(
        amount: 10,
        currency: "USD"
      ),
      autocomplete: false
    )

    # Cancel by idempotency key
    response = @client.payments.cancel_by_idempotency_key(idempotency_key: idempotency_key)

    refute_nil response
  end

  def test_should_complete_payment
    # Create payment to complete
    create_response = @client.payments.create(
      source_id: "cnon:card-nonce-ok",
      idempotency_key: new_test_uuid,
      amount_money: Square::Types::Money.new(
        amount: 200,
        currency: "USD"
      ),
      app_fee_money: Square::Types::Money.new(
        amount: 10,
        currency: "USD"
      ),
      autocomplete: false
    )

    response = @client.payments.complete(payment_id: create_response.payment.id)

    refute_nil response.payment
    assert_equal "COMPLETED", response.payment.status
  end
end
