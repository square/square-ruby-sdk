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

      def get_next
        item = try_get_next
        return item if item
        @page = @page_iterator.get_next
        try_get_next
      end

      private

      def try_get_next
        return if !@page
        @page.send(@item_field).shift
      end
    end
  end
end
