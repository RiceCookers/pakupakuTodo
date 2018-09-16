class Admin::HomeController < Admin::ApplicationController
  before_action :require_signed_in

  def index
  end
end
