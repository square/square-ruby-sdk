module Square
  module Internal
    class PageIterator
      include Enumerable

      # Instantiates a PageIterator, an Enumerable class which wraps calls to a paginated API and yields pages of items.
      #
      # @param initial_cursor [String] The initial cursor to use when iterating.
      # @return [Square::Internal::PageIterator]
      def initialize(initial_cursor:, &block)
        @cursor = initial_cursor
        @get_next_page = block
      end

      # Iterates over each page returned by the API.
      #
      # @param block [Proc] The block which is passed every page as it is received.
      # @return [nil]
      def each(&block)
        while @cursor do
          block.call(get_next)
        end
      end

      # Whether another page will be available from the API.
      #
      # @return [Boolean]
      def has_next?
        !@cursor.nil?
      end

      # Retrieves the next page from the API.
      #
      # @return [Boolean]
      def get_next
        return if @cursor.nil?
        next_page = @get_next_page.call(@cursor)
        @cursor = next_page.cursor
        next_page
      end
    end
  end
end
