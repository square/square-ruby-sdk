# frozen_string_literal: true

module Square
  module Types
    # Represents an action processed by the Square Terminal.
    class TerminalAction < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :device_id, String, optional: true, nullable: false
      field :deadline_duration, String, optional: true, nullable: false
      field :status, String, optional: true, nullable: false
      field :cancel_reason, Square::Types::ActionCancelReason, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false
      field :app_id, String, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false
      field :type, Square::Types::TerminalActionActionType, optional: true, nullable: false
      field :qr_code_options, Square::Types::QrCodeOptions, optional: true, nullable: false
      field :save_card_options, Square::Types::SaveCardOptions, optional: true, nullable: false
      field :signature_options, Square::Types::SignatureOptions, optional: true, nullable: false
      field :confirmation_options, Square::Types::ConfirmationOptions, optional: true, nullable: false
      field :receipt_options, Square::Types::ReceiptOptions, optional: true, nullable: false
      field :data_collection_options, Square::Types::DataCollectionOptions, optional: true, nullable: false
      field :select_options, Square::Types::SelectOptions, optional: true, nullable: false
      field :device_metadata, Square::Types::DeviceMetadata, optional: true, nullable: false
      field :await_next_action, Internal::Types::Boolean, optional: true, nullable: false
      field :await_next_action_duration, String, optional: true, nullable: false

    end
  end
end
