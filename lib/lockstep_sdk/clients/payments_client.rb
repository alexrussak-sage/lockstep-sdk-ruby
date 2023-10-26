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


require 'awrence'

class PaymentsClient

    ##
    # Initialize the PaymentsClient class with an API client instance.
    # @param connection [LockstepApi] The API client object for this connection
    def initialize(connection)
        @connection = connection
    end


    ##
    # Retrieves the Payment specified by this unique identifier, optionally including nested data sets.
    #
    # A Payment represents money sent from one company to another.  A single payment may contain payments for one or more invoices; it is also possible for payments to be made in advance of an invoice, for example, as a deposit.  The creator of the Payment is identified by the `CustomerId` field, and the recipient of the Payment is identified by the `CompanyId` field.  Most Payments are uniquely identified both by a Lockstep Platform ID number and a customer ERP "key" that was generated by the system that originated the Payment.  Payments that have not been fully applied have a nonzero `UnappliedAmount` value, which represents a deposit that has been paid and not yet applied to an Invoice.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this Payment; NOT the customer's ERP key
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Applications, Notes, Attachments, CustomFields
    def retrieve_payment(id:, include_param:)
        path = "/api/v1/Payments/#{id}"
        params = {:include => include_param}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Updates an existing Payment with the information supplied to this PATCH call.
    #
    # The PATCH method allows you to change specific values on the object while leaving other values alone.  As input you should supply a list of field names and new values.  If you do not provide the name of a field, that field will remain unchanged.  This allows you to ensure that you are only updating the specific fields desired.
    #
    # A Payment represents money sent from one company to another.  A single payment may contain payments for one or more invoices; it is also possible for payments to be made in advance of an invoice, for example, as a deposit.  The creator of the Payment is identified by the `CustomerId` field, and the recipient of the Payment is identified by the `CompanyId` field.  Most Payments are uniquely identified both by a Lockstep Platform ID number and a customer ERP "key" that was generated by the system that originated the Payment.  Payments that have not been fully applied have a nonzero `UnappliedAmount` value, which represents a deposit that has been paid and not yet applied to an Invoice.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of the Payment to update; NOT the customer's ERP key
    # @param body [object] A list of changes to apply to this Payment
    def update_payment(id:, body:)
        path = "/api/v1/Payments/#{id}"
        @connection.request(:patch, path, body.to_camelback_keys.to_json, nil)
    end

    ##
    # Deletes the Payment referred to by this unique identifier.
    #
    # A Payment represents money sent from one company to another.  A single payment may contain payments for one or more invoices; it is also possible for payments to be made in advance of an invoice, for example, as a deposit.  The creator of the Payment is identified by the `CustomerId` field, and the recipient of the Payment is identified by the `CompanyId` field.  Most Payments are uniquely identified both by a Lockstep Platform ID number and a customer ERP "key" that was generated by the system that originated the Payment.  Payments that have not been fully applied have a nonzero `UnappliedAmount` value, which represents a deposit that has been paid and not yet applied to an Invoice.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of the Payment to delete; NOT the customer's ERP key
    def delete_payment(id:)
        path = "/api/v1/Payments/#{id}"
        @connection.request(:delete, path, nil, nil)
    end

    ##
    # Creates one or more Payments within this account and returns the records as created.
    #
    # A Payment represents money sent from one company to another.  A single payment may contain payments for one or more invoices; it is also possible for payments to be made in advance of an invoice, for example, as a deposit.  The creator of the Payment is identified by the `CustomerId` field, and the recipient of the Payment is identified by the `CompanyId` field.  Most Payments are uniquely identified both by a Lockstep Platform ID number and a customer ERP "key" that was generated by the system that originated the Payment.  Payments that have not been fully applied have a nonzero `UnappliedAmount` value, which represents a deposit that has been paid and not yet applied to an Invoice.
    #
    # @param body [PaymentModel] The Payments to create
    def create_payments(body:)
        path = "/api/v1/Payments"
        @connection.request(:post, path, body, nil)
    end

    ##
    # Queries Payments for this account using the specified filtering, sorting, nested fetch, and pagination rules requested.
    #
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.
    #
    # A Payment represents money sent from one company to another.  A single payment may contain payments for one or more invoices; it is also possible for payments to be made in advance of an invoice, for example, as a deposit.  The creator of the Payment is identified by the `CustomerId` field, and the recipient of the Payment is identified by the `CompanyId` field.  Most Payments are uniquely identified both by a Lockstep Platform ID number and a customer ERP "key" that was generated by the system that originated the Payment.  Payments that have not been fully applied have a nonzero `UnappliedAmount` value, which represents a deposit that has been paid and not yet applied to an Invoice.
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Applications, Notes, Attachments, CustomFields
    # @param order [string] The sort order for this query. See See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_size [int32] The page size for results (default 250, maximum of 500). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_number [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    def query_payments(filter:, include_param:, order:, page_size:, page_number:)
        path = "/api/v1/Payments/query"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Retrieves a PDF file for this payment if it has been synced using an app enrollment to one of the supported apps.
    #
    # QuickBooks Online supports AR Payments.
    #
    # For other ERPs, the supported types will depend on the synced data.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this payment; NOT the customer's ERP key
    def retrieve_payment_pdf(id:)
        path = "/api/v1/Payments/#{id}/pdf"
        @connection.request(:get, path, nil, nil)
    end

    ##
    # Checks for whether a PDF file for this payment exists if it has been synced using an app enrollment to one of the supported apps.
    #
    # QuickBooks Online supports AR Payments.
    #
    # For other ERPs, the supported types will depend on the synced data.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this payment; NOT the customer's ERP key
    def check_payment_pdf(id:)
        path = "/api/v1/Payments/#{id}/pdf"
        @connection.request(:head, path, nil, nil)
    end

    ##
    # Queries Payments for this account using the specified filtering, sorting, nested fetch, and pagination rules requested.  This query endpoint provides extra data about the summary of payment information.
    #
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.
    #
    # A Payment represents money sent from one company to another.  A single payment may contain payments for one or more invoices; it is also possible for payments to be made in advance of an invoice, for example, as a deposit.  The creator of the Payment is identified by the `CustomerId` field, and the recipient of the Payment is identified by the `CompanyId` field.  Most Payments are uniquely identified both by a Lockstep Platform ID number and a customer ERP "key" that was generated by the system that originated the Payment.  Payments that have not been fully applied have a nonzero `UnappliedAmount` value, which represents a deposit that has been paid and not yet applied to an Invoice.
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Summary, Aging
    # @param order [string] The sort order for this query. See See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_size [int32] The page size for results (default 250, maximum of 500). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_number [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    def query_payment_summary_view(filter:, include_param:, order:, page_size:, page_number:)
        path = "/api/v1/Payments/views/summary"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Retrieves aggregated payment data from your account.
    #
    def retrieve_payment_detail_header()
        path = "/api/v1/Payments/views/detail-header"
        @connection.request(:get, path, nil, nil)
    end

    ##
    # Queries Payments within the Lockstep platform using the specified filtering, sorting, nested fetch, and pagination rules requested.
    #
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website. A Payment represents money sent from one company to another. A single payment may contain payments for one or more invoices; it is also possible for payments to be made in advance of an invoice, for example, as a deposit. The creator of the Payment is identified by the CustomerId field, and the recipient of the Payment is identified by the CompanyId field. Most Payments are uniquely identified both by a Lockstep Platform ID number and a customer ERP "key" that was generated by the system that originated the Payment. Payments that have not been fully applied have a nonzero UnappliedAmount value, which represents a deposit that has been paid and not yet applied to an Invoice.
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. No collections are currently available but may be offered in the future
    # @param order [string] The sort order for this query. See See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_size [int32] The page size for results (default 250, maximum of 500). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_number [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    def query_payment_detail_view(filter:, include_param:, order:, page_size:, page_number:)
        path = "/api/v1/Payments/views/detail"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number}
        @connection.request(:get, path, nil, params)
    end
end
