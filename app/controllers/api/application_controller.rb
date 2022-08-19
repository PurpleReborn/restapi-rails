module Api
    class ApplicationController < ActionController::API
      before_action :doorkeeper_authorize!
  
      private
  
      # helper method to access the current user from the token
      def current_user
        # @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
        return if doorkeeper_token.nil?

        if doorkeeper_token.resource_owner_id.present?
          User.find(doorkeeper_token.resource_owner_id)
        else
          'client_credentials'
        end
      end
    end
end