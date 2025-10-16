# frozen_string_literal: true

module Square
  module Types
    class Channel < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :version, -> { Integer }, optional: true, nullable: false
      field :reference, -> { Square::Types::Reference }, optional: true, nullable: false
      field :status, -> { Square::Types::ChannelStatus }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
