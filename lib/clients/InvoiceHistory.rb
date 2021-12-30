#
# Lockstep Software Development Kit for Ruby
#
# (c) 2021-2022 Lockstep, Inc.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author     Ted Spence <tspence@lockstep.io>
# @copyright  2021-2021 Lockstep, Inc.
# @version    2021.39
# @link       https://github.com/Lockstep-Network/lockstep-sdk-ruby
#


module LockstepSdk
    class Client
        module InvoiceHistory

            #  Retrieves the history of the Invoice specified by this unique identifier.
            #  
            #  An Invoice represents a bill sent from one company to another.  The Lockstep Platform tracks changes to each Invoice so that you can observe the changes over time.  You can view the InvoiceHistory list to monitor and observe the changes of this Invoice and track the dates when changes occurred.
            #  
            #  @param id [uuid] The unique Lockstep Platform ID number of this invoice; NOT the customer's ERP key
            def retrieve_invoice_history()
                path = "/api/v1/InvoiceHistory/#{id}"
                send_request(:get, path, nil, nil)
            end

            #  Queries Invoice History for this account using the specified filtering, sorting, and pagination rules requested.
            #  
            #  An Invoice represents a bill sent from one company to another.  The Lockstep Platform tracks changes to each Invoice so that you can observe the changes over time.  You can view the InvoiceHistory list to monitor and observe the changes of this Invoice and track the dates when changes occurred.
            #  
            #  @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
            #  @param include [string] To fetch additional data on this object, specify the list of elements to retrieve. No collections are currently available for querying but may be available in the future.
            #  @param order [string] The sort order for this query. See See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
            #  @param pageSize [int32] The page size for results (default 200). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
            #  @param pageNumber [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
            def query_invoice_history(filter, include, order, pageSize, pageNumber)
                path = "/api/v1/InvoiceHistory/query"
                send_request(:get, path, nil, {filter, include, order, pageSize, pageNumber})
            end
        end
    end
end
