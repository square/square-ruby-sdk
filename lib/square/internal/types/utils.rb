# frozen_string_literal: true

module Square
  module Internal
    module Types
      # Utilities for dealing with and checking types
      module Utils
        # Wraps a type into a type function
        #
        # @param type [Proc, Object]
        # @return [Proc]
        def self.wrap_type(type)
          case type
          when Proc
            type
          else
            -> { type }
          end
        end

        # Resolves a type or type function into a type
        #
        # @param type [Proc, Object]
        # @return [Object]
        def self.unwrap_type(type)
          type.is_a?(Proc) ? type.call : type
        end

        def self.coerce(target, value, strict: false)
          # Most optional model fields are absent in API responses. Avoid
          # resolving lazy types and dispatching coercion for these nil values.
          return nil if value.nil? && !strict

          type = unwrap_type(target)

          case type
          in Array
            case value
            when ::Array
              return type.coerce(value, strict: strict)
            when Set, ::Hash
              return coerce(type, value.to_a)
            end
          in Hash
            case value
            when ::Hash
              return type.coerce(value, strict: strict)
            when ::Array
              return coerce(type, value.to_h)
            end
          in Module if type <= NilClass
            return nil
          in Module if type <= String
            case value
            when String, Symbol, Numeric, TrueClass, FalseClass
              return value.to_s
            end
          in Module if type <= Symbol
            case value
            when Symbol, String
              return value.to_sym
            end
          in Module if type <= Integer
            case value
            when Numeric, String, Time
              return value.to_i
            end
          in Module if type <= Float
            case value
            when Numeric, Time, String
              return value.to_f
            end
          in Module if type <= Model
            case value
            when type
              return value
            when ::Hash
              return type.coerce(value, strict: strict)
            end
          in Module
            return type.coerce(value, strict: strict) if type.singleton_class.include?(Enum) || type.singleton_class.include?(Union)
          else
            value
          end

          raise Errors::TypeError, "cannot coerce value of type `#{value.class}` to `#{target}`" if strict

          value
        end

        def self.symbolize_keys(hash)
          hash.transform_keys(&:to_sym)
        end

        # Converts camelCase keys to snake_case symbols
        # This allows SDK methods to accept both snake_case and camelCase keys
        # e.g., { refundMethod: ... } becomes { refund_method: ... }
        #
        # @param hash [Hash]
        # @return [Hash]
        def self.normalize_keys(hash)
          hash.transform_keys do |key|
            key_str = key.to_s
            # Convert camelCase to snake_case
            snake_case = key_str.gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase
            snake_case.to_sym
          end
        end
      end
    end
  end
end
