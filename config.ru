# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
Refile.secret_key = '34c0ce4255a573549d7de913ccb0e0a64282b6609ca5befc2f92faf47af825de13bce7b66887e7b81ec97cb0a170ac1f2462c7dd4cdd83847214a1cf64df48e1'
