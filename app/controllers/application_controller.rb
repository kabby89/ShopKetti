class ApplicationController < ActionController::Base
	before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def devise_paramter_sanitizer
  	if resource_class == User
  		User::ParameterSanitizer.new(User, :user, :seller_company_name)
  	else
  		super
  	end
  end
  	protected

  	def configure_permitted_parameters
   	devise_parameter_sanitizer.for(:sign_up) << :user_type
  	end
end
