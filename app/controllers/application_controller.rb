# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def render_404
    render :partial => 'common/error404', :status => 422
  end
end
