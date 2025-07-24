# frozen_string_literal: true
require "faraday/multipart"
require "mini_mime"

module square.rb
# Utility class for managing files.
  class FileUtilities


    # @param file_like [String, IO] The file to be uploaded, or a string path to the file.
    # @return [Faraday::Multipart::FilePart]
    def self.as_faraday_multipart(file_like:)
      unless file_like.is_a?(String)
        path = file_like.path
      else
        path = file_like
      end
      mime_type = MiniMime.lookup_by_filename(path)
      unless mime_type.nil?
        mime_type = mime_type.content_type
      else
        mime_type = "application/octet-stream"
      end
      Faraday::Multipart::FilePart.new(file_like, mime_type)
    end
  end
end