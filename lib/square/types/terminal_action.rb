# frozen_string_literal: true

module Square
  module Types
    # Represents an action processed by the Square Terminal.
    class TerminalAction < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :device_id, String, optional: true, nullable: false
      field :deadline_duration, String, optional: true, nullable: false
      field :status, String, optional: true, nullable: false
      field :cancel_reason, Square::ActionCancelReason, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false
      field :app_id, String, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false
      field :type, Square::TerminalActionActionType, optional: true, nullable: false
      field :qr_code_options, Square::QrCodeOptions, optional: true, nullable: false
      field :save_card_options, Square::SaveCardOptions, optional: true, nullable: false
      field :signature_options, Square::SignatureOptions, optional: true, nullable: false
      field :confirmation_options, Square::ConfirmationOptions, optional: true, nullable: false
      field :receipt_options, Square::ReceiptOptions, optional: true, nullable: false
      field :data_collection_options, Square::DataCollectionOptions, optional: true, nullable: false
      field :select_options, Square::SelectOptions, optional: true, nullable: false
      field :device_metadata, Square::DeviceMetadata, optional: true, nullable: false
      field :await_next_action, Internal::Types::Boolean, optional: true, nullable: false
      field :await_next_action_duration, String, optional: true, nullable: false

    end
  end
end
