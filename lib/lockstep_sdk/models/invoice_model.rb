#
# Lockstep Software Development Kit for Ruby
#
# (c) 2021-2022 Lockstep, Inc.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author     Ted Spence <tspence@lockstep.io>
# @copyright  2021-2022 Lockstep, Inc.
# @version    2022.3
# @link       https://github.com/Lockstep-Network/lockstep-sdk-ruby
#


module LockstepSdk

    # An Invoice represents a bill sent from one company to another.  The creator of the invoice is identified
    # by the `CompanyId` field, and the recipient of the invoice is identified by the `CustomerId` field.  Most
    # invoices are uniquely identified both by a Lockstep Platform ID number and a customer ERP "key" that was
    # generated by the system that originated the invoice.  Invoices have a total amount and a due date, and when
    # some payments have been made on the Invoice the `TotalAmount` and the `OutstandingBalanceAmount` may be
    # different.
    class invoiceModel
        # @return [uuid] The GroupKey uniquely identifies a single Lockstep Platform account. All records for this account will share the same GroupKey value. GroupKey values cannot be changed once created. For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
        attr_accessor :group_key
        # @return [uuid] The unique ID of this record, automatically assigned by Lockstep when this record is added to the Lockstep platform. For the ID of this record in its originating financial system, see `ErpKey`.
        attr_accessor :invoice_id
        # @return [uuid] The ID number of the company that created this invoice.
        attr_accessor :company_id
        # @return [uuid] The ID number of the counterparty for the invoice, for example, a customer or vendor.
        attr_accessor :customer_id
        # @return [string] The unique ID of this record as it was known in its originating financial system. If this company record was imported from a financial system, it will have the value `ErpKey` set to the original primary key number of the record as it was known in the originating financial system. If this record was not imported, this value will be `null`. For more information, see [Identity Columns](https://developer.lockstep.io/docs/identity-columns).
        attr_accessor :erp_key
        # @return [string] The purchase order code as it exists in the user's ERP or accounting system.
        attr_accessor :purchase_order_code
        # @return [string] An additional reference code that is sometimes used to identify this invoice. The meaning of this field is specific to the ERP or accounting system used by the user.
        attr_accessor :reference_code
        # @return [string] A code identifying the salesperson responsible for writing this quote, invoice, or order.
        attr_accessor :salesperson_code
        # @return [string] A string identifying the salesperson responsible for writing this quote, invoice, or order.
        attr_accessor :salesperson_name
        # @return [string] A code identifying the type of this invoice.
        attr_accessor :invoice_type_code
        # @return [string] A code identifying the status of this invoice.
        attr_accessor :invoice_status_code
        # @return [string] A code identifying the terms given to the purchaser.
        attr_accessor :terms_code
        # @return [string] If the customer negotiated any special terms different from the standard terms above, describe them here.
        attr_accessor :special_terms
        # @return [string] The three-character ISO 4217 currency code used for this invoice.
        attr_accessor :currency_code
        # @return [double] The total value of this invoice, inclusive of all taxes and line items.
        attr_accessor :total_amount
        # @return [double] The total sales (or transactional) tax calculated for this invoice.
        attr_accessor :sales_tax_amount
        # @return [double] The total discounts given by the seller to the buyer on this invoice.
        attr_accessor :discount_amount
        # @return [double] The remaining balance value of this invoice.
        attr_accessor :outstanding_balance_amount
        # @return [date] The reporting date for this invoice.
        attr_accessor :invoice_date
        # @return [date] The date when discounts were adjusted for this invoice.
        attr_accessor :discount_date
        # @return [date] The date when this invoice posted to the company's general ledger.
        attr_accessor :posted_date
        # @return [date] The date when the invoice was closed and finalized after completion of all payments and delivery of all products and services.
        attr_accessor :invoice_closed_date
        # @return [date] The date when the remaining outstanding balance is due.
        attr_accessor :payment_due_date
        # @return [date-time] The date and time when this record was imported from the user's ERP or accounting system.
        attr_accessor :imported_date
        # @return [uuid] The ID number of the invoice's origination address
        attr_accessor :primary_origin_address_id
        # @return [uuid] The ID number of the invoice's bill-to address
        attr_accessor :primary_bill_to_address_id
        # @return [uuid] The ID number of the invoice's ship-to address
        attr_accessor :primary_ship_to_address_id
        # @return [date-time] The date on which this address record was created.
        attr_accessor :created
        # @return [uuid] The ID number of the user who created this address.
        attr_accessor :created_user_id
        # @return [date-time] The date on which this address record was last modified.
        attr_accessor :modified
        # @return [uuid] The ID number of the user who most recently modified this address.
        attr_accessor :modified_user_id
        # @return [uuid] AppEnrollmentId for this record; used for mapping purposes.
        attr_accessor :app_enrollment_id
        # @return [boolean] Is the invoice voided?
        attr_accessor :is_voided
        # @return [boolean] Is the invoice in dispute?
        attr_accessor :in_dispute
        # @return [boolean] Should the invoice be excluded from aging calculations?
        attr_accessor :exclude_from_aging
        # @return [invoiceAddressModel] All addresses connected to this invoice. To retrieve this collection, specify `Addresses` in the "Include" parameter for your query.
        attr_accessor :addresses
        # @return [invoiceLineModel] All lines attached to this invoice. To retrieve this collection, specify `Lines` in the "Include" parameter for your query.
        attr_accessor :lines
        # @return [invoicePaymentDetailModel] All payments attached to this invoice, the amount of the payment applied to this Invoice, and the date the Payment was applied. To retrieve this collection, specify `Payments` in the "Include" parameter for your query.
        attr_accessor :payments
        # @return [noteModel] All notes attached to this invoice. To retrieve this collection, specify `Notes` in the "Include" parameter for your query.
        attr_accessor :notes
        # @return [attachmentModel] All attachments attached to this invoice. To retrieve this collection, specify `Attachments` in the "Include" parameter for your query.
        attr_accessor :attachments
        # @return [companyModel] The Company associated to this invoice. To retrieve this item, specify `Company` in the "Include" parameter for your query.
        attr_accessor :company
        # @return [companyModel] The Customer associated to the invoice customer To retrieve this item, specify `Customer` in the "Include" parameter for your query.
        attr_accessor :customer
        # @return [contactModel] The Contact associated to the invoice customer To retrieve this item, specify `Customer` in the "Include" parameter for your query.
        attr_accessor :customer_primary_contact
        # @return [creditMemoInvoiceModel] The credit memos associated to this invoice. To retrieve this item, specify `CreditMemos` in the "Include" parameter for your query.
        attr_accessor :credit_memos
        # @return [customFieldValueModel] All custom field values associated with this invoice To retrieve this item, specify `CustomFieldValues` in the "Include" parameter for your query.
        attr_accessor :custom_field_values
        # @return [customFieldDefinitionModel] All custom field definitions
        attr_accessor :custom_field_definitions
    end
end
