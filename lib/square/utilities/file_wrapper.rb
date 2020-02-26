module Square
  # A utility to allow users to set the content-type for files
  class FileWrapper
    attr_reader :content_type
    attr_reader :file

    def initialize(file, content_type: 'application/octet-stream')
      @file = file
      @content_type = content_type
    end
  end
end
