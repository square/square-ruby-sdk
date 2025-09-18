module Square
  module Internal
    class CursorItemIterator
      include Enumerable

      # Instantiates a CursorItemIterator, an Enumerable class which wraps calls to a cursor-based paginated API and yields individual items from it.
      #
      # @param initial_cursor [String] The initial cursor to use when iterating, if any.
      # @param cursor_field [Symbol] The field in API responses to extract the next cursor from.
      # @param item_field [Symbol] The field in API responses to extract the items to iterate over.
      def initialize(initial_cursor:, cursor_field:, item_field:, &block)
        @item_field = item_field
        @page_iterator = CursorPageIterator.new(initial_cursor:, cursor_field:, &block)
        @page = nil
      end

      # Returns the CursorPageIterator mediating access to the underlying API.
      #
      # @return [Square::Internal::CursorPageIterator]
      def pages
        @page_iterator
      end

      # Iterates over each item returned by the API.
      #
      # @param block [Proc] The block which each retrieved item is yielded to.
      # @return [nil]
      def each(&block)
        while item = get_next do
          block.call(item)
        end
      end

      # Whether another item will be available from the API.
      #
      # @return [Boolean]
      def has_next?
        load_next_page if @page.nil?
        return false if @page.nil?

        return true if any_items_in_cached_page
        load_next_page
        any_items_in_cached_page
      end

      # Retrieves the next item from the API.
      #
      # @return [Boolean]
      def get_next
        item = next_item_from_cached_page
        return item if item
        load_next_page
        next_item_from_cached_page
      end

      private

      def next_item_from_cached_page
        return if !@page
        @page.send(@item_field).shift
      end

      def any_items_in_cached_page
        return false if !@page
        !@page.send(@item_field).empty?
      end

      def load_next_page
        @page = @page_iterator.get_next
      end
    end
  end
end
