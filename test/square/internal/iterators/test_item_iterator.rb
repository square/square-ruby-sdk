# frozen_string_literal: true

require "minitest/autorun"
require "stringio"
require "json"
require "test_helper"
require "ostruct"

NUMBERS = (1..65).to_a

class ItemIteratorTest < Minitest::Test
  def test_item_iterator_can_iterate_to_exhaustion
    iterator = get_iterator(initial_cursor: 0)
    assert_equal NUMBERS, iterator.to_a

    iterator = get_iterator(initial_cursor: 10)
    assert_equal (11..65).to_a, iterator.to_a
  end

  def test_items_iterator_iterates_lazily
    iterator = get_iterator(initial_cursor: 0)
    assert_equal 0, @times_called
    assert_equal 1, iterator.first
    assert_equal 1, @times_called

    iterator = get_iterator(initial_cursor: 0)
    assert_equal 0, @times_called
    assert_equal (1..15).to_a, iterator.first(15)
    assert_equal 2, @times_called
  end

  def test_pages_iterator
    iterator = get_iterator(initial_cursor: 0).pages
    assert_equal(
      [
        (1..10).to_a,
        (11..20).to_a,
        (21..30).to_a,
        (31..40).to_a,
        (41..50).to_a,
        (51..60).to_a,
        (61..65).to_a,
      ],
      iterator.to_a.map{|p| p.cards}
    )

    iterator = get_iterator(initial_cursor: 10).pages
    assert_equal(
      [
        (11..20).to_a,
        (21..30).to_a,
        (31..40).to_a,
        (41..50).to_a,
        (51..60).to_a,
        (61..65).to_a,
      ],
      iterator.to_a.map{|p| p.cards}
    )
  end

  def get_iterator(initial_cursor:)
    @times_called = 0

    Square::Internal::ItemIterator.new(initial_cursor:, item_field: :cards) do |cursor|
      @times_called += 1
      next_cursor = cursor + 10
      OpenStruct.new(
        cards: NUMBERS[cursor...next_cursor],
        cursor: next_cursor < NUMBERS.length ? next_cursor : nil
      )
    end
  end
end
