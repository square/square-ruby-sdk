module Square
  # A utility to allow users to set the content-type for files
  class FileWrapper < CoreLibrary::FileWrapper
    # The constructor.
    # @param [File] file The file to be sent in the request.
    # @param [string] content_type The content type of the provided file.
    def initialize(file, content_type: 'application/octet-stream')
      super
    end
  end
end
