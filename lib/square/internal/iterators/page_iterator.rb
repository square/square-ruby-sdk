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
          block.call(get_next_page)
        end
      end

      def has_next_page?
        !@cursor.nil?
      end

      def get_next_page
        return if @cursor.nil?
        next_page = @get_next_page.call(@cursor)
        @cursor = next_page.cursor
        next_page
      end
    end
  end
end
