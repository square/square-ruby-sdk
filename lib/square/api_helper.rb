module Square
  # API utility class
  class APIHelper
    # Serializes an array parameter (creates key value pairs).
    # @param [String] The name of the parameter.
    # @param [Array] The value of the parameter.
    # @param [String] The format of the serialization.
    def self.serialize_array(key, array, formatting: 'indexed')
      tuples = []

      tuples += case formatting
                when 'csv'
                  [[key, array.map { |element| CGI.escape(element.to_s) }.join(',')]]
                when 'psv'
                  [[key, array.map { |element| CGI.escape(element.to_s) }.join('|')]]
                when 'tsv'
                  [[key, array.map { |element| CGI.escape(element.to_s) }.join("\t")]]
                else
                  array.map { |element| [key, element] }
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

      parameters.each do |key, val|
        if val.nil?
          replace_value = ''
        elsif val['value'].instance_of? Array
          if val['encode'] == true
            val['value'].map! { |element| CGI.escape(element.to_s) }
          else
            val['value'].map!(&:to_s)
          end
          replace_value = val['value'].join('/')
        else
          replace_value = if val['encode'] == true
                            CGI.escape(val['value'].to_s)
                          else
                            val['value'].to_s
                          end
        end

        # Find the template parameter and replace it with its value.
        query_builder = query_builder.gsub("{#{key}}", replace_value)
      end
      query_builder
    end

    # Appends the given set of parameters to the given query string.
    # @param [String] The query string builder to add the query parameters to.
    # @param [Hash] The parameters to append.
    def self.append_url_with_query_parameters(query_builder, parameters)
      # Perform parameter validation.
      unless query_builder.instance_of? String
        raise ArgumentError, 'Given value for parameter \"query_builder\"
          is invalid.'
      end

      # Return if there are no parameters to replace.
      return query_builder if parameters.nil?

      array_serialization = 'indexed'
      parameters = process_complex_types_parameters(parameters, array_serialization)

      parameters.each do |key, value|
        seperator = query_builder.include?('?') ? '&' : '?'
        unless value.nil?
          if value.instance_of? Array
            value.compact!
            APIHelper.serialize_array(
              key, value, formatting: array_serialization
            ).each do |element|
              seperator = query_builder.include?('?') ? '&' : '?'
              query_builder += "#{seperator}#{element[0]}=#{element[1]}"
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
      matches = url.match(%r{^(https?://[^/]+)})
      raise ArgumentError, 'Invalid Url format.' if matches.nil?

      # Get the http protocol match.
      protocol = matches[1]

      # Check if parameters exist.
      index = url.index('?')

      # Remove redundant forward slashes.
      query = url[protocol.length...(!index.nil? ? index : url.length)]
      query.gsub!(%r{//+}, '/')

      # Get the parameters.
      parameters = !index.nil? ? url[url.index('?')...url.length] : ''

      # Return processed url.
      protocol + query + parameters
    end

    # Parses JSON string.
    # @param [String] A JSON string.
    def self.json_deserialize(json)
      JSON.parse(json, symbolize_names: true)
    rescue StandardError
      raise TypeError, 'Server responded with invalid JSON.'
    end

    # Parses JSON string.
    # @param [object] The object to serialize.
    def self.json_serialize(obj)
      serializable_types.map { |x| obj.is_a? x }.any? ? obj.to_s : obj.to_json
    end

    # Removes elements with empty values from a hash.
    # @param [Hash] The hash to clean.
    def self.clean_hash(hash)
      hash.delete_if { |_key, value| value.to_s.strip.empty? }
    end

    # Form encodes a hash of parameters.
    # @param [Hash] The hash of parameters to encode.
    # @return [Hash] A hash with the same parameters form encoded.
    def self.form_encode_parameters(form_parameters)
      array_serialization = 'indexed'
      encoded = {}
      form_parameters.each do |key, value|
        encoded.merge!(APIHelper.form_encode(value, key, formatting:
          array_serialization))
      end
      encoded
    end

    # Process complex types in query_params.
    # @param [Hash] The hash of query parameters.
    # @return [Hash] A hash with the processed query parameters.
    def self.process_complex_types_parameters(query_parameters, array_serialization)
      processed_params = {}
      query_parameters.each do |key, value|
        processed_params.merge!(APIHelper.form_encode(value, key, formatting:
          array_serialization))
      end
      processed_params
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

      # Create a form encoded hash for this object.
      if obj.nil?
        nil
      elsif obj.instance_of? Array
        if formatting == 'indexed'
          obj.each_with_index do |value, index|
            retval.merge!(APIHelper.form_encode(value, "#{instance_name}[#{index}]"))
          end
        elsif APIHelper.serializable_types.map { |x| obj[0].is_a? x }.any?
          obj.each do |value|
            abc = if formatting == 'unindexed'
                    APIHelper.form_encode(value, "#{instance_name}[]",
                                          formatting: formatting)
                  else
                    APIHelper.form_encode(value, instance_name,
                                          formatting: formatting)
                  end
            retval = APIHelper.custom_merge(retval, abc)
          end
        else
          obj.each_with_index do |value, index|
            retval.merge!(APIHelper.form_encode(value, "#{instance_name}[#{index}]",
                                                formatting: formatting))
          end
        end
      elsif obj.instance_of? Hash
        obj.each do |key, value|
          retval.merge!(APIHelper.form_encode(value, "#{instance_name}[#{key}]",
                                              formatting: formatting))
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

    # Deserialize the value against the template (group of types).
    # @param [String] The value to be deserialized.
    # @param [String] The parameter indicates the type-combination
    # against which the value will be mapped (oneOf(Integer, String)).
    def self.deserialize(template, value)
      decoded = APIHelper.json_deserialize(value)
      map_types(decoded, template)
    end

    # Validates and processes the value against the template(group of types).
    # @param [String] The value to be mapped against the template.
    # @param [String] The parameter indicates the group of types (oneOf(Integer, String)).
    # @param [String] The parameter indicates the group (oneOf|anyOf).
    def self.map_types(value, template, group_name: nil)
      result_value = nil
      matches = 0
      types = []
      group_name = template.partition('(').first if group_name.nil? && template.match?(/anyOf|oneOf/)

      return if value.nil?

      if template.end_with?('{}') || template.end_with?('[]')
        types = template.split(group_name, 2).last.gsub(/\s+/, '').split
      else
        template = template.split(group_name, 2).last.delete_prefix('(').delete_suffix(')')
        types = template.scan(/(anyOf|oneOf)[(]([^[)]]*)[)]/).flatten.combination(2).map { |a, b| "#{a}(#{b})" }
        types.each { |t| template = template.gsub(", #{t}", '') }
        types = template.gsub(/\s+/, '').split(',').push(*types)
      end
      types.each do |element|
        if element.match?(/^(oneOf|anyOf)[(].*$/)
          begin
            result_value = map_types(value, element, matches)
            matches += 1
          rescue ValidationException
            next
          end
        elsif element.end_with?('{}')
          result_value, matches = map_hash_type(value, element, group_name, matches)
        elsif element.end_with?('[]')
          result_value, matches = map_array_type(value, element, group_name, matches)
        else
          begin
            result_value, matches = map_type(value, element, group_name, matches)
          rescue StandardError
            next
          end
        end
        break if group_name == 'anyOf' && matches == 1
      end
      raise ValidationException.new(value, template) unless matches == 1

      value = result_value unless result_value.nil?
      value
    end

    # Validates and processes the value against the [Hash] type.
    # @param [String] The value to be mapped against the type.
    # @param [String] The possible type of the value.
    # @param [String] The parameter indicates the group (oneOf|anyOf).
    # @param [Integer] The parameter indicates the number of matches of value against types.
    def self.map_hash_type(value, type, group_name, matches)
      if value.instance_of? Hash
        decoded = {}
        value.each do |key, val|
          type = type.chomp('{}').to_s
          val = map_types(val, type, group_name: group_name)
          decoded[key] = val unless type.empty?
        rescue ValidationException
          next
        end
        matches += 1 if decoded.length == value.length
        value = decoded unless decoded.empty?
      end
      [value, matches]
    end

    # Validates and processes the value against the [Array] type.
    # @param [String] The value to be mapped against the type.
    # @param [String] The possible type of the value.
    # @param [String] The parameter indicates the group (oneOf|anyOf).
    # @param [Integer] The parameter indicates the number of matches of value against types.
    def self.map_array_type(value, type, group_name, matches)
      if value.instance_of? Array
        decoded = []
        value.each do |val|
          type = type.chomp('[]').to_s
          val = map_types(val, type, group_name: group_name)
          decoded.append(val) unless type.empty?
        rescue ValidationException
          next
        end
        matches += 1 if decoded.length == value.length
        value = decoded unless decoded.empty?
      end
      [value, matches]
    end

    # Validates and processes the value against the type.
    # @param [String] The value to be mapped against the type.
    # @param [String] The possible type of the value.
    # @param [String] The parameter indicates the group (oneOf|anyOf).
    # @param [Integer] The parameter indicates the number of matches of value against types.
    def self.map_type(value, type, _group_name, matches)
      if Square.constants.select do |c|
        Square.const_get(c).to_s == "Square::#{type}"
      end.empty?
        value, matches = map_data_type(value, type, matches)
      else
        value, matches = map_complex_type(value, type, matches)
      end
      [value, matches]
    end

    # Validates and processes the value against the complex types.
    # @param [String] The value to be mapped against the type.
    # @param [String] The possible type of the value.
    # @param [Integer] The parameter indicates the number of matches of value against types.
    def self.map_complex_type(value, type, matches)
      obj = Square.const_get(type)
      value = if obj.respond_to? 'from_hash'
                obj.send('from_hash', value)
              else
                obj.constants.find { |k| obj.const_get(k) == value }
              end
      matches += 1 unless value.nil?
      [value, matches]
    end

    # Validates and processes the value against the data types.
    # @param [String] The value to be mapped against the type.
    # @param [String] The possible type of the value.
    # @param [Integer] The parameter indicates the number of matches of value against types.
    def self.map_data_type(value, element, matches)
      element = element.split('|').map { |x| Object.const_get x }
      matches += 1 if element.all? { |x| APIHelper.data_types.include?(x) } &&
                      element.any? { |x| (value.instance_of? x) || (value.class.ancestors.include? x) }
      [value, matches]
    end

    # Validates the value against the template(group of types).
    # @param [String] The value to be mapped against the type.
    # @param [String] The parameter indicates the group of types (oneOf(Integer, String)).
    def self.validate_types(value, template)
      map_types(APIHelper.json_deserialize(value.to_json), template)
    end

    # Get content-type depending on the value
    def self.get_content_type(value)
      if serializable_types.map { |x| value.is_a? x }.any?
        'text/plain; charset=utf-8'
      else
        'application/json; charset=utf-8'
      end
    end

    # Array of serializable types
    def self.serializable_types
      [String, Numeric, TrueClass,
       FalseClass, Date, DateTime]
    end

    # Array of supported data types
    def self.data_types
      [String, Float, Integer,
       TrueClass, FalseClass, Date,
       DateTime, Array, Hash, Object]
    end
  end
end
