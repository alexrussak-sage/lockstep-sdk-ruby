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

class CompaniesClient

    ##
    # Initialize the CompaniesClient class with an API client instance.
    # @param connection [LockstepApi] The API client object for this connection
    def initialize(connection)
        @connection = connection
    end


    ##
    # Retrieves the Company specified by this unique identifier, optionally including nested data sets.
    #
    # A Company represents a customer, a vendor, or a company within the organization of the account holder. Companies can have parents and children, representing an organizational hierarchy of corporate entities. You can use Companies to track projects and financial data under this Company label.
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this Company; NOT the customer's ERP key
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Attachments, Contacts, CustomFields, Invoices, Notes, Classification
    def retrieve_company(id:, include_param:)
        path = "/api/v1/Companies/#{id}"
        params = {:include => include_param}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Updates a Company that matches the specified id with the requested information.
    #
    # The PATCH method allows you to change specific values on the object while leaving other values alone.  As input you should supply a list of field names and new values.  If you do not provide the name of a field, that field will remain unchanged.  This allows you to ensure that you are only updating the specific fields desired.
    #
    # A Company represents a customer, a vendor, or a company within the organization of the account holder. Companies can have parents and children, representing an organizational hierarchy of corporate entities. You can use Companies to track projects and financial data under this Company label.
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this Company; NOT the customer's ERP key
    # @param body [object] A list of changes to apply to this Company
    def update_company(id:, body:)
        path = "/api/v1/Companies/#{id}"
        @connection.request(:patch, path, body.to_camelback_keys.to_json, nil)
    end

    ##
    # Delete the Company referred to by this unique identifier.
    #
    # A Company represents a customer, a vendor, or a company within the organization of the account holder. Companies can have parents and children, representing an organizational hierarchy of corporate entities. You can use Companies to track projects and financial data under this Company label.
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this Company; NOT the customer's ERP key
    def delete_company(id:)
        path = "/api/v1/Companies/#{id}"
        @connection.request(:delete, path, nil, nil)
    end

    ##
    # Creates one or more Companies from a given model.
    #
    # A Company represents a customer, a vendor, or a company within the organization of the account holder. Companies can have parents and children, representing an organizational hierarchy of corporate entities. You can use Companies to track projects and financial data under this Company label.
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param body [CompanyModel] The Companies to create
    def create_companies(body:)
        path = "/api/v1/Companies"
        @connection.request(:post, path, body, nil)
    end

    ##
    # Delete the Companies referred to by these unique identifiers.
    #
    # A Company represents a customer, a vendor, or a company within the organization of the account holder. Companies can have parents and children, representing an organizational hierarchy of corporate entities. You can use Companies to track projects and financial data under this Company label.
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param body [BulkDeleteRequestModel] The unique Lockstep Platform ID numbers of the Companies to delete; NOT the customer's ERP key
    def delete_companies(body:)
        path = "/api/v1/Companies"
        @connection.request(:delete, path, body, nil)
    end

    ##
    # Queries Companies for this account using the specified filtering, sorting, nested fetch, and pagination rules requested.
    #
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.
    #
    # A Company represents a customer, a vendor, or a company within the organization of the account holder. Companies can have parents and children, representing an organizational hierarchy of corporate entities. You can use Companies to track projects and financial data under this Company label.
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Attachments, Contacts, CustomFields, Invoices, Notes, Classification
    # @param order [string] The sort order for the results, in the [Searchlight order syntax](https://github.com/tspence/csharp-searchlight).
    # @param page_size [int32] The page size for results (default 250, maximum of 500)
    # @param page_number [int32] The page number for results (default 0)
    def query_companies(filter:, include_param:, order:, page_size:, page_number:)
        path = "/api/v1/Companies/query"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Queries Customer Summaries for this account using the specified filtering, sorting, nested fetch, and pagination rules requested.
    #
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.
    #
    # The Customer Summary View represents a slightly different view of the data and includes some extra fields that might be useful. For more information, see the data format of the Customer Summary Model.
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. No collections are currently available but may be offered in the future
    # @param order [string] The sort order for the results, in the [Searchlight order syntax](https://github.com/tspence/csharp-searchlight).
    # @param page_size [int32] The page size for results (default 250, maximum of 500)
    # @param page_number [int32] The page number for results (default 0)
    # @param report_date [date-time] The date to calculate the fields on. If no date is entered the current UTC date will be used.
    def query_customer_summary(filter:, include_param:, order:, page_size:, page_number:, report_date:)
        path = "/api/v1/Companies/views/customer-summary"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number, :reportDate => report_date}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Queries Vendor Summaries for this account using the specified filtering, sorting, nested fetch, and pagination rules requested.
    #
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.
    #
    # The Vendor Summary View represents a slightly different view of the data and includes some extra fields that might be useful. For more information, see the data format of the Vendor Summary Model.
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. No collections are currently available but may be offered in the future
    # @param order [string] The sort order for the results, in the [Searchlight order syntax](https://github.com/tspence/csharp-searchlight).
    # @param page_size [int32] The page size for results (default 250, maximum of 500)
    # @param page_number [int32] The page number for results (default 0)
    # @param report_date [date-time] The date to calculate the fields on. If no date is entered the current UTC date will be used.
    def query_vendor_summary(filter:, include_param:, order:, page_size:, page_number:, report_date:)
        path = "/api/v1/Companies/views/vendor-summary"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number, :reportDate => report_date}
        @connection.request(:get, path, nil, params)
    end

    ##
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. No collections are currently available but may be offered in the future
    # @param order [string] The sort order for the results, in the [Searchlight order syntax](https://github.com/tspence/csharp-searchlight).
    # @param page_size [int32] The page size for results (default 250, maximum of 500)
    # @param page_number [int32] The page number for results (default 0)
    def query_magic_link_summary(filter:, include_param:, order:, page_size:, page_number:)
        path = "/api/v1/Companies/views/magic-link-summary"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Retrieves the Company Details specified by this unique identifier, optionally including nested data sets.
    #
    # The Company Detail View represents a slightly different view of the data and includes some extra fields that might be useful. For more information, see the data format of the Company Detail Model.
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this Company; NOT the company's ERP key
    def retrieve_company_detail(id:)
        path = "/api/v1/Companies/views/details/#{id}"
        @connection.request(:get, path, nil, nil)
    end

    ##
    # Sets the logo for specified company. The logo will be stored in the Lockstep Platform and will be **publicly accessible**.
    #
    # .jpg, .jpeg, .png, and .webp are supported. 2MB maximum. If no logo is uploaded, the existing logo will be deleted.
    #
    # A Company represents a customer, a vendor, or a company within the organization of the account holder. Companies can have parents and children, representing an organizational hierarchy of corporate entities. You can use Companies to track projects and financial data under this Company label.
    #
    # Optional view box meta data for the provided logo may be supplied using the following query parameters. Please note that you must supply either all of the values or none of the values. <ul><li>min_x</li><li>min_y</li><li>width</li><li>height</li></ul>
    #
    # See [Vendors, Customers, and Companies](https://developer.lockstep.io/docs/companies-customers-and-vendors) for more information.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this Company; NOT the customer's ERP key
    # @param min_x [double] ViewBox minX setting for this Company's logo.
    # @param min_y [double] ViewBox minY setting for this Company's logo.
    # @param width [double] ViewBox width setting for this Company's logo.
    # @param height [double] ViewBox height setting for this Company's logo.
    # @param filename [File] The full path of a file to upload to the API
    def set_company_logo(id:, min_x:, min_y:, width:, height:, filename:)
        path = "/api/v1/Companies/#{id}/logo"
        params = {:min_x => min_x, :min_y => min_y, :width => width, :height => height}
        @connection.request(:post, path, nil, params)
    end

    ##
    # Update view box meta data for the given Company id.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this Company; NOT the customer's ERP key
    # @param body [ViewBoxSettingsModel] The `ViewBoxSettingsModel` containing meta data value updates
    def update_logo_view_box_settings(id:, body:)
        path = "/api/v1/Companies/#{id}/logo-settings"
        @connection.request(:patch, path, body, nil)
    end
end
