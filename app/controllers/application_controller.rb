class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def render_success
    render :file => "#{Rails.root}/public/200.html", :status => 200
  end
end
