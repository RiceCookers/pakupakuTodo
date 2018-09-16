class Api::V1::ApplicationController < ActionController::Base
  # before_action :doorkeeper_authorize!

  private

    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
end