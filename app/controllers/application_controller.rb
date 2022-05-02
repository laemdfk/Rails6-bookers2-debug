class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_request_form
  # 遷移前のページを保存しておくメソッド

  private
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end


  def after_sign_out_path_for(resource)
   root_path
  end

# 前のページに戻れるようにするためのアクション
 def set_request_from
   if request.referer
     redirect_to :back and return true
   elsif @request_from
    redirect_to @request_from and return true 
   end
 end
 
 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
