module Square
  # API utility class
  class APIHelper
    # Serializes an array parameter (creates key value pairs).
    # @param [String] The name of the parameter.
    # @param [Array] The value of the parameter.
    # @param [String] The format of the serialization.
    def self.serialize_array(key, array, formatting: 'indexed')
      tuples = []

      if formatting == 'unindexed'
        tuples += array.map { |element| ["#{key}[]", element] }
      elsif formatting == 'indexed'
        tuples += array.map.with_index do |element, index|
          ["#{key}[#{index}]", element]
        end
      elsif formatting == 'plain'
        tuples += array.map { |element| [key, element] }
      else
        raise ArgumentError, 'Invalid format provided.'
      end
      tuples
    end

    # Replaces template parameters in the given url.
    # @param [String] The query string builder to replace the template
    # parameters.
    # @param [Hash] The parameters to replace in the url.
    def self.append_url_with_template_parameters(query_builder, parameters)
      # perform parameter validation
      unless query_builder.instance_of? String
        raise ArgumentError, 'Given value for parameter \"query_builder\" is
          invalid.'
      end

      # Return if there are no parameters to replace.
      return query_builder if parameters.nil?

      # Iterate and append parameters.
      parameters.each do |key, value|
        replace_value = ''

        if value.nil?
          replace_value = ''
        elsif value.instance_of? Array
          value.map! { |element| CGI.escape(element.to_s) }
          replace_value = value.join('/')
        else
          replace_value = CGI.escape(value.to_s)
        end

        # Find the template parameter and replace it with its value.
        query_builder = query_builder.gsub('{' + key.to_s + '}', replace_value)
      end
      query_builder
    end

    # Appends the given set of parameters to the given query string.
    # @param [String] The query string builder to add the query parameters to.
    # @param [Hash] The parameters to append.
    # @param [String] The format of array parameter serialization.
    def self.append_url_with_query_parameters(query_builder, parameters,
                                              array_serialization: 'indexed')
      # Perform parameter validation.
      unless query_builder.instance_of? String
        raise ArgumentError, 'Given value for parameter \"query_builder\"
          is invalid.'
      end

      # Return if there are no parameters to replace.
      return query_builder if parameters.nil?

      parameters.each do |key, value|
        seperator = query_builder.include?('?') ? '&' : '?'
        unless value.nil?
          if value.instance_of? Array
            value.compact!
            query_builder += if array_serialization == 'csv'
                               "#{seperator}#{key}=#{value.map do |element|
                                 CGI.escape(element.to_s)
                               end.join(',')}"
                             elsif array_serialization == 'psv'
                               "#{seperator}#{key}=#{value.map do |element|
                                 CGI.escape(element.to_s)
                               end.join('|')}"
                             elsif array_serialization == 'tsv'
                               "#{seperator}#{key}=#{value.map do |element|
                                 CGI.escape(element.to_s)
                               end.join("\t")}"
                             else
                               "#{seperator}#{APIHelper.serialize_array(
                                 key, value, formatting: array_serialization
                               ).map { |k, v| "#{k}=#{CGI.escape(v.to_s)}" }
                               .join('&')}"
                             end
          else
            query_builder += "#{seperator}#{key}=#{CGI.escape(value.to_s)}"
          end
        end
      end
      query_builder
    end

    # Validates and processes the given Url.
    # @param [String] The given Url to process.
    # @return [String] Pre-processed Url as string.
    def self.clean_url(url)
      # Perform parameter validation.
      raise ArgumentError, 'Invalid Url.' unless url.instance_of? String

      # Ensure that the urls are absolute.
      matches = url.match(%r{^(https?:\/\/[^\/]+)})
      raise ArgumentError, 'Invalid Url format.' if matches.nil?

      # Get the http protocol match.
      protocol = matches[1]

      # Check if parameters exist.
      index = url.index('?')

      # Remove redundant forward slashes.
      query = url[protocol.length...(!index.nil? ? index : url.length)]
      query.gsub!(%r{\/\/+}, '/')

      # Get the parameters.
      parameters = !index.nil? ? url[url.index('?')...url.length] : ''

      # Return processed url.
      protocol + query + parameters
    end

    # Parses JSON string.
    # @param [String] A JSON string.
    def self.json_deserialize(json)
      return JSON.parse(json, symbolize_names: true)
    rescue StandardError
      raise TypeError, 'Server responded with invalid JSON.'
    end

    # Removes elements with empty values from a hash.
    # @param [Hash] The hash to clean.
    def self.clean_hash(hash)
      hash.delete_if { |_key, value| value.to_s.strip.empty? }
    end

    # Form encodes a hash of parameters.
    # @param [Hash] The hash of parameters to encode.
    # @return [Hash] A hash with the same parameters form encoded.
    def self.form_encode_parameters(form_parameters,
                                    array_serialization: 'indexed')
      encoded = {}
      form_parameters.each do |key, value|
        encoded.merge!(APIHelper.form_encode(value, key, formatting:
          array_serialization))
      end
      encoded
    end

    def self.custom_merge(a, b)
      x = {}
      a.each do |key, value_a|
        b.each do |k, value_b|
          next unless key == k
          x[k] = []
          if value_a.instance_of? Array
            value_a.each do |v|
              x[k].push(v)
            end
          else
            x[k].push(value_a)
          end
          if value_b.instance_of? Array
            value_b.each do |v|
              x[k].push(v)
            end
          else
            x[k].push(value_b)
          end
          a.delete(k)
          b.delete(k)
        end
      end
      x.merge!(a)
      x.merge!(b)
      x
    end

    # Form encodes an object.
    # @param [Dynamic] An object to form encode.
    # @param [String] The name of the object.
    # @return [Hash] A form encoded representation of the object in the form
    # of a hash.
    def self.form_encode(obj, instance_name, formatting: 'indexed')
      retval = {}

      serializable_types = [String, Numeric, TrueClass,
                            FalseClass, Date, DateTime]

      # Create a form encoded hash for this object.
      if obj.nil?
        nil
      elsif obj.instance_of? Array
        if formatting == 'indexed'
          obj.each_with_index do |value, index|
            retval.merge!(APIHelper.form_encode(value, instance_name + '[' +
              index.to_s + ']'))
          end
        elsif serializable_types.map { |x| obj[0].is_a? x }.any?
          obj.each do |value|
            abc = if formatting == 'unindexed'
                    APIHelper.form_encode(value, instance_name + '[]',
                                          formatting: formatting)
                  else
                    APIHelper.form_encode(value, instance_name,
                                          formatting: formatting)
                  end
            retval = APIHelper.custom_merge(retval, abc)
          end
        else
          obj.each_with_index do |value, index|
            retval.merge!(APIHelper.form_encode(value, instance_name + '[' +
              index.to_s + ']', formatting: formatting))
          end
        end
      elsif obj.instance_of? Hash
        obj.each do |key, value|
          retval.merge!(APIHelper.form_encode(value, instance_name + '[' +
            key.to_s + ']', formatting: formatting))
        end
      elsif obj.instance_of? File
        retval[instance_name] = UploadIO.new(
          obj, 'application/octet-stream', File.basename(obj.path)
        )
      else
        retval[instance_name] = obj
      end
      retval
    end

    # Retrieves a field from a Hash/Array based on an Array of keys/indexes
    # @param [Hash, Array] The hash to extract data from
    # @param [Array<String, Integer>] The keys/indexes to use
    # @return [Object] The extracted value
    def self.map_response(obj, keys)
      val = obj
      begin
        keys.each do |key|
          val = if val.is_a? Array
                  if key.to_i.to_s == key
                    val[key.to_i]
                  else
                    val = nil
                  end
                else
                  val.fetch(key.to_sym)
                end
        end
      rescue NoMethodError, TypeError, IndexError
        val = nil
      end
      val
    end

    # Safely converts a string into an rfc3339 DateTime object
    # @param [String] The datetime string
    # @return [DateTime] A DateTime object of rfc3339 format
    def self.rfc3339(date_time)
      # missing timezone information
      if date_time.end_with?('Z') || date_time.index('+')
        DateTime.rfc3339(date_time)
      else
        DateTime.rfc3339(date_time + 'Z')
      end
    end
  end
end
