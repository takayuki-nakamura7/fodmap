class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, :if => :devise_controller?

  # このアクションを追加
  def after_sign_in_path_for(_resource)
    "/user/#{current_user.id}"
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    added_attrs = %i[firstName lastName]
    devise_parameter_sanitizer.permit :sign_up, :keys => added_attrs
    devise_parameter_sanitizer.permit :account_update, :keys => added_attrs
  end
end
