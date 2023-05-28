class ApplicationController < ActionController::Base
  
  def authenticate_admin_user!
    if current_admin_user.present? and current_user.blank?
      sign_in current_admin_user, bypass: true
    end

    super
  end
end
