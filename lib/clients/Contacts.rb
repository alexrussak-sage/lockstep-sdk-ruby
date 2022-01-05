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
# @version    2021.39
# @link       https://github.com/Lockstep-Network/lockstep-sdk-ruby
#


module LockstepSdk
    class Client
        module Contacts

            #  Retrieves the Contact specified by this unique identifier, optionally including nested data sets.  A Contact contains information about a person or role within a Company. You can use Contacts to track information about who is responsible for a specific project, who handles invoices, or information about which role at a particular customer or vendor you should speak with about invoices.
            #  
            #  @param id [uuid] The unique Lockstep Platform ID number of this Contact; NOT the customer's ERP key
            #  @param include [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Attachments, CustomFields, Notes
            def retrieve_contact(include)
                path = "/api/v1/Contacts/#{id}"
                send_request(:get, path, nil, {include})
            end

            #  Updates a contact that matches the specified id with the requested information.
            #  
            #  The PATCH method allows you to change specific values on the object while leaving other values alone.  As input you should supply a list of field names and new values.  If you do not provide the name of a field, that field will remain unchanged.  This allows you to ensure that you are only updating the specific fields desired.  A Contact contains information about a person or role within a Company. You can use Contacts to track information about who is responsible for a specific project, who handles invoices, or information about which role at a particular customer or vendor you should speak with about invoices.
            #  
            #  @param id [uuid] The unique Lockstep Platform ID number of the Contact to update; NOT the customer's ERP key
            #  @param body [object] A list of changes to apply to this Contact
            def update_contact()
                path = "/api/v1/Contacts/#{id}"
                send_request(:patch, path, body, nil)
            end

            #  Disable the Contact referred to by this unique identifier.
            #  
            #  A Contact contains information about a person or role within a Company. You can use Contacts to track information about who is responsible for a specific project, who handles invoices, or information about which role at a particular customer or vendor you should speak with about invoices.
            #  
            #  @param id [uuid] The unique Lockstep Platform ID number of the Contact to disable; NOT the customer's ERP key
            def disable_contact()
                path = "/api/v1/Contacts/#{id}"
                send_request(:delete, path, nil, nil)
            end

            #  Creates one or more contacts from a given model.
            #  
            #  A Contact contains information about a person or role within a Company. You can use Contacts to track information about who is responsible for a specific project, who handles invoices, or information about which role at a particular customer or vendor you should speak with about invoices.
            #  
            #  @param body [ContactModel] The Contacts to create
            def create_contacts()
                path = "/api/v1/Contacts"
                send_request(:post, path, body, nil)
            end

            #  Queries Contacts for this account using the specified filtering, sorting, nested fetch, and pagination rules requested.
            #  
            #  More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.  A Contact contains information about a person or role within a Company. You can use Contacts to track information about who is responsible for a specific project, who handles invoices, or information about which role at a particular customer or vendor you should speak with about invoices.
            #  
            #  @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
            #  @param include [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Attachments, CustomFields, Notes
            #  @param order [string] The sort order for this query. See See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
            #  @param pageSize [int32] The page size for results (default 200). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
            #  @param pageNumber [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
            def query_contacts(filter, include, order, pageSize, pageNumber)
                path = "/api/v1/Contacts/query"
                send_request(:get, path, nil, {filter, include, order, pageSize, pageNumber})
            end
        end
    end
end
