module Square
  module Internal
    class ItemIterator
      include Enumerable

      def initialize(initial_cursor:, item_field:, &block)
        @item_field = item_field
        @page_iterator = PageIterator.new(initial_cursor:, &block)
        @page = nil
      end

      def pages
        @page_iterator
      end

      def each(&block)
        while item = get_next do
          block.call(item)
        end
      end

      def has_next?
        load_next_page if @page.nil?
        return false if @page.nil?

        return true if any_items_in_cached_page
        load_next_page
        any_items_in_cached_page
      end

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
