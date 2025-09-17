module Square
  module Internal
    class PageIterator
      include Enumerable

      def initialize(initial_cursor:, &block)
        @cursor = initial_cursor
        @get_next_page = block
      end

      def each(&block)
        while @cursor do
          next_page = @get_next_page.call(@cursor)
          @cursor = next_page.cursor
          block.call(next_page)
        end
      end

      def has_next_page?
        !@cursor.nil?
      end
    end
  end
end
