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
        module Provisioning

            #  Creates a new User or updates an Invited user based on metadata provided by the User during the onboarding process
            #  
            #  @param body [ProvisioningModel] Represents a User and their related metadata
            def provision_user_account()
                path = "/api/v1/Provisioning"
                send_request(:post, path, body, nil)
            end

            #  Updates user, company and group metadata for a User of status 'Onboarding' and finalizes a user's onboarding process by changing the user status to 'Active'
            #  
            #  @param body [ProvisioningFinalizeRequestModel] Represents a User and their related metadata
            def finalize_user_account_provisioning()
                path = "/api/v1/Provisioning/finalize"
                send_request(:post, path, body, nil)
            end
        end
    end
end
