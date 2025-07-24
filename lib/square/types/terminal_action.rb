# frozen_string_literal: true
require_relative "action_cancel_reason"
require_relative "terminal_action_action_type"
require_relative "qr_code_options"
require_relative "save_card_options"
require_relative "signature_options"
require_relative "confirmation_options"
require_relative "receipt_options"
require_relative "data_collection_options"
require_relative "select_options"
require_relative "device_metadata"
require "ostruct"
require "json"

module square.rb
# Represents an action processed by the Square Terminal.
  class TerminalAction
  # @return [String] A unique ID for this `TerminalAction`.
    attr_reader :id
  # @return [String] The unique Id of the device intended for this `TerminalAction`.
#  The Id can be retrieved from /v2/devices api.
    attr_reader :device_id
  # @return [String] The duration as an RFC 3339 duration, after which the action will be
#  automatically canceled.
#  TerminalActions that are `PENDING` will be automatically `CANCELED` and have a
#  cancellation reason
#  of `TIMED_OUT`
#  Default: 5 minutes from creation
#  Maximum: 5 minutes
    attr_reader :deadline_duration
  # @return [String] The status of the `TerminalAction`.
#  Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
    attr_reader :status
  # @return [square.rb::ActionCancelReason] The reason why `TerminalAction` is canceled. Present if the status is
#  `CANCELED`.
#  See [ActionCancelReason](#type-actioncancelreason) for possible values
    attr_reader :cancel_reason
  # @return [String] The time when the `TerminalAction` was created as an RFC 3339 timestamp.
    attr_reader :created_at
  # @return [String] The time when the `TerminalAction` was last updated as an RFC 3339 timestamp.
    attr_reader :updated_at
  # @return [String] The ID of the application that created the action.
    attr_reader :app_id
  # @return [String] The location id the action is attached to, if a link can be made.
    attr_reader :location_id
  # @return [square.rb::TerminalActionActionType] Represents the type of the action.
#  See [ActionType](#type-actiontype) for possible values
    attr_reader :type
  # @return [square.rb::QrCodeOptions] Describes configuration for the QR code action. Requires `QR_CODE` type.
    attr_reader :qr_code_options
  # @return [square.rb::SaveCardOptions] Describes configuration for the save-card action. Requires `SAVE_CARD` type.
    attr_reader :save_card_options
  # @return [square.rb::SignatureOptions] Describes configuration for the signature capture action. Requires `SIGNATURE`
#  type.
    attr_reader :signature_options
  # @return [square.rb::ConfirmationOptions] Describes configuration for the confirmation action. Requires `CONFIRMATION`
#  type.
    attr_reader :confirmation_options
  # @return [square.rb::ReceiptOptions] Describes configuration for the receipt action. Requires `RECEIPT` type.
    attr_reader :receipt_options
  # @return [square.rb::DataCollectionOptions] Describes configuration for the data collection action. Requires
#  `DATA_COLLECTION` type.
    attr_reader :data_collection_options
  # @return [square.rb::SelectOptions] Describes configuration for the select action. Requires `SELECT` type.
    attr_reader :select_options
  # @return [square.rb::DeviceMetadata] Details about the Terminal that received the action request (such as battery
#  level,
#  operating system version, and network connection settings).
#  Only available for `PING` action type.
    attr_reader :device_metadata
  # @return [Boolean] Indicates the action will be linked to another action and requires a waiting
#  dialog to be
#  displayed instead of returning to the idle screen on completion of the action.
#  Only supported on SIGNATURE, CONFIRMATION, DATA_COLLECTION, and SELECT types.
    attr_reader :await_next_action
  # @return [String] The timeout duration of the waiting dialog as an RFC 3339 duration, after which
#  the
#  waiting dialog will no longer be displayed and the Terminal will return to the
#  idle screen.
#  Default: 5 minutes from when the waiting dialog is displayed
#  Maximum: 5 minutes
    attr_reader :await_next_action_duration
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID for this `TerminalAction`.
    # @param device_id [String] The unique Id of the device intended for this `TerminalAction`.
#  The Id can be retrieved from /v2/devices api.
    # @param deadline_duration [String] The duration as an RFC 3339 duration, after which the action will be
#  automatically canceled.
#  TerminalActions that are `PENDING` will be automatically `CANCELED` and have a
#  cancellation reason
#  of `TIMED_OUT`
#  Default: 5 minutes from creation
#  Maximum: 5 minutes
    # @param status [String] The status of the `TerminalAction`.
#  Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
    # @param cancel_reason [square.rb::ActionCancelReason] The reason why `TerminalAction` is canceled. Present if the status is
#  `CANCELED`.
#  See [ActionCancelReason](#type-actioncancelreason) for possible values
    # @param created_at [String] The time when the `TerminalAction` was created as an RFC 3339 timestamp.
    # @param updated_at [String] The time when the `TerminalAction` was last updated as an RFC 3339 timestamp.
    # @param app_id [String] The ID of the application that created the action.
    # @param location_id [String] The location id the action is attached to, if a link can be made.
    # @param type [square.rb::TerminalActionActionType] Represents the type of the action.
#  See [ActionType](#type-actiontype) for possible values
    # @param qr_code_options [square.rb::QrCodeOptions] Describes configuration for the QR code action. Requires `QR_CODE` type.
    # @param save_card_options [square.rb::SaveCardOptions] Describes configuration for the save-card action. Requires `SAVE_CARD` type.
    # @param signature_options [square.rb::SignatureOptions] Describes configuration for the signature capture action. Requires `SIGNATURE`
#  type.
    # @param confirmation_options [square.rb::ConfirmationOptions] Describes configuration for the confirmation action. Requires `CONFIRMATION`
#  type.
    # @param receipt_options [square.rb::ReceiptOptions] Describes configuration for the receipt action. Requires `RECEIPT` type.
    # @param data_collection_options [square.rb::DataCollectionOptions] Describes configuration for the data collection action. Requires
#  `DATA_COLLECTION` type.
    # @param select_options [square.rb::SelectOptions] Describes configuration for the select action. Requires `SELECT` type.
    # @param device_metadata [square.rb::DeviceMetadata] Details about the Terminal that received the action request (such as battery
#  level,
#  operating system version, and network connection settings).
#  Only available for `PING` action type.
    # @param await_next_action [Boolean] Indicates the action will be linked to another action and requires a waiting
#  dialog to be
#  displayed instead of returning to the idle screen on completion of the action.
#  Only supported on SIGNATURE, CONFIRMATION, DATA_COLLECTION, and SELECT types.
    # @param await_next_action_duration [String] The timeout duration of the waiting dialog as an RFC 3339 duration, after which
#  the
#  waiting dialog will no longer be displayed and the Terminal will return to the
#  idle screen.
#  Default: 5 minutes from when the waiting dialog is displayed
#  Maximum: 5 minutes
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TerminalAction]
    def initialize(id: OMIT, device_id: OMIT, deadline_duration: OMIT, status: OMIT, cancel_reason: OMIT, created_at: OMIT, updated_at: OMIT, app_id: OMIT, location_id: OMIT, type: OMIT, qr_code_options: OMIT, save_card_options: OMIT, signature_options: OMIT, confirmation_options: OMIT, receipt_options: OMIT, data_collection_options: OMIT, select_options: OMIT, device_metadata: OMIT, await_next_action: OMIT, await_next_action_duration: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @device_id = device_id if device_id != OMIT
      @deadline_duration = deadline_duration if deadline_duration != OMIT
      @status = status if status != OMIT
      @cancel_reason = cancel_reason if cancel_reason != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @app_id = app_id if app_id != OMIT
      @location_id = location_id if location_id != OMIT
      @type = type if type != OMIT
      @qr_code_options = qr_code_options if qr_code_options != OMIT
      @save_card_options = save_card_options if save_card_options != OMIT
      @signature_options = signature_options if signature_options != OMIT
      @confirmation_options = confirmation_options if confirmation_options != OMIT
      @receipt_options = receipt_options if receipt_options != OMIT
      @data_collection_options = data_collection_options if data_collection_options != OMIT
      @select_options = select_options if select_options != OMIT
      @device_metadata = device_metadata if device_metadata != OMIT
      @await_next_action = await_next_action if await_next_action != OMIT
      @await_next_action_duration = await_next_action_duration if await_next_action_duration != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "device_id": device_id, "deadline_duration": deadline_duration, "status": status, "cancel_reason": cancel_reason, "created_at": created_at, "updated_at": updated_at, "app_id": app_id, "location_id": location_id, "type": type, "qr_code_options": qr_code_options, "save_card_options": save_card_options, "signature_options": signature_options, "confirmation_options": confirmation_options, "receipt_options": receipt_options, "data_collection_options": data_collection_options, "select_options": select_options, "device_metadata": device_metadata, "await_next_action": await_next_action, "await_next_action_duration": await_next_action_duration }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalAction
    #
    # @param json_object [String] 
    # @return [square.rb::TerminalAction]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      device_id = parsed_json["device_id"]
      deadline_duration = parsed_json["deadline_duration"]
      status = parsed_json["status"]
      cancel_reason = parsed_json["cancel_reason"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      app_id = parsed_json["app_id"]
      location_id = parsed_json["location_id"]
      type = parsed_json["type"]
      unless parsed_json["qr_code_options"].nil?
        qr_code_options = parsed_json["qr_code_options"].to_json
        qr_code_options = square.rb::QrCodeOptions.from_json(json_object: qr_code_options)
      else
        qr_code_options = nil
      end
      unless parsed_json["save_card_options"].nil?
        save_card_options = parsed_json["save_card_options"].to_json
        save_card_options = square.rb::SaveCardOptions.from_json(json_object: save_card_options)
      else
        save_card_options = nil
      end
      unless parsed_json["signature_options"].nil?
        signature_options = parsed_json["signature_options"].to_json
        signature_options = square.rb::SignatureOptions.from_json(json_object: signature_options)
      else
        signature_options = nil
      end
      unless parsed_json["confirmation_options"].nil?
        confirmation_options = parsed_json["confirmation_options"].to_json
        confirmation_options = square.rb::ConfirmationOptions.from_json(json_object: confirmation_options)
      else
        confirmation_options = nil
      end
      unless parsed_json["receipt_options"].nil?
        receipt_options = parsed_json["receipt_options"].to_json
        receipt_options = square.rb::ReceiptOptions.from_json(json_object: receipt_options)
      else
        receipt_options = nil
      end
      unless parsed_json["data_collection_options"].nil?
        data_collection_options = parsed_json["data_collection_options"].to_json
        data_collection_options = square.rb::DataCollectionOptions.from_json(json_object: data_collection_options)
      else
        data_collection_options = nil
      end
      unless parsed_json["select_options"].nil?
        select_options = parsed_json["select_options"].to_json
        select_options = square.rb::SelectOptions.from_json(json_object: select_options)
      else
        select_options = nil
      end
      unless parsed_json["device_metadata"].nil?
        device_metadata = parsed_json["device_metadata"].to_json
        device_metadata = square.rb::DeviceMetadata.from_json(json_object: device_metadata)
      else
        device_metadata = nil
      end
      await_next_action = parsed_json["await_next_action"]
      await_next_action_duration = parsed_json["await_next_action_duration"]
      new(
        id: id,
        device_id: device_id,
        deadline_duration: deadline_duration,
        status: status,
        cancel_reason: cancel_reason,
        created_at: created_at,
        updated_at: updated_at,
        app_id: app_id,
        location_id: location_id,
        type: type,
        qr_code_options: qr_code_options,
        save_card_options: save_card_options,
        signature_options: signature_options,
        confirmation_options: confirmation_options,
        receipt_options: receipt_options,
        data_collection_options: data_collection_options,
        select_options: select_options,
        device_metadata: device_metadata,
        await_next_action: await_next_action,
        await_next_action_duration: await_next_action_duration,
        additional_properties: struct
      )
    end
# Serialize an instance of TerminalAction to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.device_id&.is_a?(String) != false || raise("Passed value for field obj.device_id is not the expected type, validation failed.")
      obj.deadline_duration&.is_a?(String) != false || raise("Passed value for field obj.deadline_duration is not the expected type, validation failed.")
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.cancel_reason&.is_a?(square.rb::ActionCancelReason) != false || raise("Passed value for field obj.cancel_reason is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.app_id&.is_a?(String) != false || raise("Passed value for field obj.app_id is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.type&.is_a?(square.rb::TerminalActionActionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.qr_code_options.nil? || square.rb::QrCodeOptions.validate_raw(obj: obj.qr_code_options)
      obj.save_card_options.nil? || square.rb::SaveCardOptions.validate_raw(obj: obj.save_card_options)
      obj.signature_options.nil? || square.rb::SignatureOptions.validate_raw(obj: obj.signature_options)
      obj.confirmation_options.nil? || square.rb::ConfirmationOptions.validate_raw(obj: obj.confirmation_options)
      obj.receipt_options.nil? || square.rb::ReceiptOptions.validate_raw(obj: obj.receipt_options)
      obj.data_collection_options.nil? || square.rb::DataCollectionOptions.validate_raw(obj: obj.data_collection_options)
      obj.select_options.nil? || square.rb::SelectOptions.validate_raw(obj: obj.select_options)
      obj.device_metadata.nil? || square.rb::DeviceMetadata.validate_raw(obj: obj.device_metadata)
      obj.await_next_action&.is_a?(Boolean) != false || raise("Passed value for field obj.await_next_action is not the expected type, validation failed.")
      obj.await_next_action_duration&.is_a?(String) != false || raise("Passed value for field obj.await_next_action_duration is not the expected type, validation failed.")
    end
  end
end