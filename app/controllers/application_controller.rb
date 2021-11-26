class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!, if: :admin_url 
  before_action :authenticate_user!,except: [:top, :attention]

  # パスに「/admin」が含まれているかどうかを確認する。
  def admin_url
    request.fullpath.include?("/admin")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :use_rules])
  end
  
end
