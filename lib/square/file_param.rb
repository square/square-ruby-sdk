# frozen_string_literal: true

require "fileutils"
require "stringio"

module Square
  # FileParam is a utility class for handling files in multipart form data.
  #
  # @attr_reader [IO] io The readable object
  # @attr_reader [String, nil] filename The filename
  # @attr_reader [String, nil] content_type The content type
  class FileParam
    attr_reader :io, :filename, :content_type

    # Create a new file parameter.
    #
    # @param io [#read] A readable object (File, StringIO, etc.)
    # @param filename [String, nil] Optional filename
    # @param content_type [String, nil] Optional content type
    def initialize(io:, filename: nil, content_type: nil)
      @io = io
      @filename = filename
      @content_type = content_type
    end

    # Creates a FileParam instance from a filepath.
    #
    # @param filepath [String] Path to the file
    # @param filename [String, nil] Optional filename (defaults to basename of filepath)
    # @param content_type [String, nil] Optional content type
    # @return [FileParam] A new FileParam instance
    # @raise [StandardError] If the file cannot be opened or read
    def self.from_filepath(filepath:, filename: nil, content_type: nil)
      begin
        # Handle both string paths and file objects
        if filepath.is_a?(String)
          file = File.open(filepath, "rb")
        elsif filepath.respond_to?(:read)
          # If it's already a readable object, use it directly
          file = filepath
        else
          raise "Invalid filepath: must be a string path or readable object"
        end
      rescue StandardError => e
        raise "Unable to open file #{filepath}: #{e.message}"
      end

      new(
        io: file,
        filename: filename || (filepath.is_a?(String) ? File.basename(filepath) : "file"),
        content_type: content_type
      )
    end

    # Creates a FileParam instance from a string.
    #
    # @param content [String] The content string
    # @param filename [String, nil] Required filename
    # @param content_type [String, nil] Optional content type
    # @return [FileParam] A new FileParam instance
    def self.from_string(content:, filename:, content_type: nil)
      new(
        io: StringIO.new(content),
        filename: filename,
        content_type: content_type
      )
    end

    # Maps this FileParam to a FormDataPart.
    #
    # @param name [String] The name of the form field
    # @param content_type [String, nil] Overrides the content type, if provided
    # @return [Square::Internal::Multipart::FormDataPart] A multipart form data part representing this file
    def to_form_data_part(name:, content_type: nil)
      content_type ||= @content_type
      headers = content_type ? { "Content-Type" => content_type } : nil

      Square::Internal::Multipart::FormDataPart.new(
        name: name,
        value: @io,
        filename: @filename,
        headers: headers
      )
    end

    # Closes the file IO if it responds to close.
    #
    # @return [nil]
    def close
      @io.close if @io.respond_to?(:close)
      nil
    end
  end
end
