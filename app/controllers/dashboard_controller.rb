class DashboardController < ApplicationController
  layout 'dashboard'
  skip_before_action :authenticate_user!, :only => [:index]

  def index
  end
end
