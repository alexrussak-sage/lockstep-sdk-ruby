#
# Lockstep Platform SDK for Ruby
#
# (c) 2021-2023 Lockstep, Inc.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author     Lockstep Network <support@lockstep.io>
# @copyright  2021-2023 Lockstep, Inc.
# @link       https://github.com/Lockstep-Network/lockstep-sdk-ruby
#


require 'json'

module LockstepSdk

    ##
    # A note is a customizable text string that can be attached to various account attributes
    # within Lockstep. You can use notes for internal communication, correspondence with
    # clients, or personal reminders. The Note Model represents a note and a number of
    # different metadata attributes related to the creation, storage, and ownership of the note.
    #
    # See [Extensibility](https://developer.lockstep.io/docs/extensibility) for more information.
    class NoteModel

        ##
        # Initialize the NoteModel using the provided prototype
        def initialize(params = {})
            @note_id = params.dig(:note_id)
            @group_key = params.dig(:group_key)
            @table_key = params.dig(:table_key)
            @object_key = params.dig(:object_key)
            @note_text = params.dig(:note_text)
            @note_type = params.dig(:note_type)
            @is_archived = params.dig(:is_archived)
            @created = params.dig(:created)
            @created_user_id = params.dig(:created_user_id)
            @modified = params.dig(:modified)
            @modified_user_id = params.dig(:modified_user_id)
            @created_user_name = params.dig(:created_user_name)
            @app_enrollment_id = params.dig(:app_enrollment_id)
            @recipient_name = params.dig(:recipient_name)
        end

        ##
        # @return [Uuid] The unique ID of this record, automatically assigned by Lockstep when this record is added to the Lockstep platform.
        attr_accessor :note_id

        ##
        # @return [Uuid] The GroupKey uniquely identifies a single Lockstep Platform account. All records for this account will share the same GroupKey value. GroupKey values cannot be changed once created. For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
        attr_accessor :group_key

        ##
        # @return [String] A Note is connected to an existing item within the Lockstep Platform by the fields `TableKey` and `ObjectKey`. For example, a Note connected to Invoice 12345 would have a `TableKey` value of `Invoice` and an `ObjectKey` value of `12345`. The `TableKey` value contains the name of the table within the Lockstep Platform to which this metadata is connected. For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
        attr_accessor :table_key

        ##
        # @return [Uuid] A Note is connected to an existing item within the Lockstep Platform by the fields `TableKey` and `ObjectKey`. For example, a Note connected to Invoice 12345 would have a `TableKey` value of `Invoice` and an `ObjectKey` value of `12345`. The `ObjectKey` value contains the primary key of the record within the Lockstep Platform to which this metadata is connected. For more information, see [linking metadata to an object](https://developer.lockstep.io/docs/custom-fields#linking-metadata-to-an-object).
        attr_accessor :object_key

        ##
        # @return [String] The full text of the note
        attr_accessor :note_text

        ##
        # @return [String] The type of the note
        attr_accessor :note_type

        ##
        # @return [Boolean] A flag indicating whether this Note is archived (also known as hidden or deleted). When you call [ArchiveNote](https://developer.lockstep.io/reference/delete_api-v1-notes-id) this field will be set to true. You should avoid displaying Notes with the IsArchived field set to true in your user interface.
        attr_accessor :is_archived

        ##
        # @return [Date-time] The date the note was created
        attr_accessor :created

        ##
        # @return [Uuid] The unique ID of the [UserAccount](https://developer.lockstep.io/docs/useraccountmodel) of the user who created this Note.
        attr_accessor :created_user_id

        ##
        # @return [Date-time] The date this note was last modified
        attr_accessor :modified

        ##
        # @return [Uuid] The ID of the user who last modified this note
        attr_accessor :modified_user_id

        ##
        # @return [String] The name of the user who created the note
        attr_accessor :created_user_name

        ##
        # @return [Uuid] The AppEnrollmentId of the application that imported this record. For accounts with more than one financial system connected, this field identifies the originating financial system that produced this record. This value is null if this record was not loaded from an external ERP or financial system.
        attr_accessor :app_enrollment_id

        ##
        # @return [String] The person to whom this note is intended for.
        attr_accessor :recipient_name

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'noteId' => @note_id,
                'groupKey' => @group_key,
                'tableKey' => @table_key,
                'objectKey' => @object_key,
                'noteText' => @note_text,
                'noteType' => @note_type,
                'isArchived' => @is_archived,
                'created' => @created,
                'createdUserId' => @created_user_id,
                'modified' => @modified,
                'modifiedUserId' => @modified_user_id,
                'createdUserName' => @created_user_name,
                'appEnrollmentId' => @app_enrollment_id,
                'recipientName' => @recipient_name,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
