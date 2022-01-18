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


class applications_client

    # Initialize the applications_client class with a lockstepsdk instance.
    def initialize(lockstepsdk)
        @lockstepsdk = lockstepsdk
    end


    # Retrieves the Application with this identifier.
    # 
    # An Application represents a feature available to customers within the Lockstep Platform.  You can create Applications by working with your Lockstep business development manager and publish them on the platform so that customers can browse and find your Application on the Lockstep Platform Marketplace.  When a customer adds an Application to their account, they obtain an AppEnrollment which represents that customer's instance of this Application.  The customer-specific AppEnrollment contains a customer's configuration data for the Application, which is not customer-specific.
    # 
    # See [Applications and Enrollments](https://developer.lockstep.io/docs/applications-and-enrollments) for more information.
    # 
    # @param id [uuid] The unique ID number of the Application to retrieve
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Notes, Attachments, CustomFields
    def retrieve_application(id:, include_param:)
        path = "/api/v1/Applications/#{id}"
        params = {:include => include_param}
        @lockstepsdk.request(:get, path, nil, params)
    end

    # Updates an existing Application with the information supplied to this PATCH call.
    # 
    # The PATCH method allows you to change specific values on the object while leaving other values alone.  As input you should supply a list of field names and new values.  For example, you can provide the field name "IsActive" and specify the new value "False"; this API will then change the value of IsActive to false.   An Application represents a feature available to customers within the Lockstep Platform.  You can create Applications by working with your Lockstep business development manager and publish them on the platform so that customers can browse and find your Application on the Lockstep Platform Marketplace.  When a customer adds an Application to their account, they obtain an AppEnrollment which represents that customer's instance of this Application.  The customer-specific AppEnrollment contains a customer's configuration data for the Application, which is not customer-specific.
    # 
    # See [Applications and Enrollments](https://developer.lockstep.io/docs/applications-and-enrollments) for more information.
    # 
    # @param id [uuid] The unique ID number of the Application to update
    # @param body [object] A list of changes to apply to this Application
    def update_application(id:)
        path = "/api/v1/Applications/#{id}"
        params = {}
        @lockstepsdk.request(:patch, path, body, params)
    end

    # Deletes the Application referred to by this unique identifier.  Information about this Application is retained but after the DELETE call, this Application is no longer available for use on the Lockstep Platform.  An Application represents a feature available to customers within the Lockstep Platform.  You can create Applications by working with your Lockstep business development manager and publish them on the platform so that customers can browse and find your Application on the Lockstep Platform Marketplace.  When a customer adds an Application to their account, they obtain an AppEnrollment which represents that customer's instance of this Application.  The customer-specific AppEnrollment contains a customer's configuration data for the Application, which is not customer-specific.
    # 
    # See [Applications and Enrollments](https://developer.lockstep.io/docs/applications-and-enrollments) for more information.
    # 
    # @param id [uuid] The unique ID number of the Application to delete
    def delete_application(id:)
        path = "/api/v1/Applications/#{id}"
        params = {}
        @lockstepsdk.request(:delete, path, nil, params)
    end

    # Creates one or more Applications and returns the records as created.  Applications are universal and available across all accounts.
    # 
    # An Application represents a feature available to customers within the Lockstep Platform.  You can create Applications by working with your Lockstep business development manager and publish them on the platform so that customers can browse and find your Application on the Lockstep Platform Marketplace.  When a customer adds an Application to their account, they obtain an AppEnrollment which represents that customer's instance of this Application.  The customer-specific AppEnrollment contains a customer's configuration data for the Application, which is not customer-specific.
    # 
    # See [Applications and Enrollments](https://developer.lockstep.io/docs/applications-and-enrollments) for more information.
    # 
    # @param body [application_model] The Applications to create
    def create_applications()
        path = "/api/v1/Applications"
        @lockstepsdk.request(:post, path, body, nil)
    end

    # Queries Applications on the Lockstep Platform using the specified filtering, sorting, nested fetch, and pagination rules requested.
    # 
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.  An Application represents a feature available to customers within the Lockstep Platform.  You can create Applications by working with your Lockstep business development manager and publish them on the platform so that customers can browse and find your Application on the Lockstep Platform Marketplace.  When a customer adds an Application to their account, they obtain an AppEnrollment which represents that customer's instance of this Application.  The customer-specific AppEnrollment contains a customer's configuration data for the Application, which is not customer-specific.
    # 
    # See [Applications and Enrollments](https://developer.lockstep.io/docs/applications-and-enrollments) for more information.
    # 
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Notes, Attachments, CustomFields
    # @param order [string] The sort order for this query. See See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param pageSize [int32] The page size for results (default 200). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param pageNumber [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    def query_applications(filter:, include_param:, order:, pageSize:, pageNumber:)
        path = "/api/v1/Applications/query"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => pageSize, :pageNumber => pageNumber}
        @lockstepsdk.request(:get, path, nil, params)
    end
end
