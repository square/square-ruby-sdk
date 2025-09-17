require 'enumerable'

module Square
  module Internal
    class ItemIterator
      include Enumerable

      def initialize(initial_cursor:, item_field:, &block)
        @item_field = item_field
        @page_iterator = PageIterator.new(initial_cursor:, &block)
      end

      def each(&block)
        @page_iterator.each do |page|
          page.send(@item_field).each(&block)
        end
      end

      def pages
        @page_iterator
      end
    end
  end
end
