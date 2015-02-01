class ApplicationController < ActionController::Base
	before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
  	if !session[:order_id].nil?
  		Order.find(session[:order_id])
  	else
  		Order.new
  	end
  end



  	protected

  	def configure_permitted_parameters
   	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_type, :id, :user_id, :company_name, :logo, :email, :password, :password_confirmation, :image, :company_description, :seller_address_1, :seller_address_2, :seller_city, :seller_state, :seller_zipcode, :seller_telephone, :buyer_ship_to_address_1, :buyer_ship_to_address_2, :buyer_ship_to_address_3, :buyer_ship_to_city, :buyer_ship_to_state, :buyer_ship_to_zip, :buyer_sold_to_address_1, :buyer_sold_to_address_2, :buyer_sold_to_address_3, :buyer_sold_to_city, :buyer_sold_to_state, :buyer_sold_to_zip, :buyer_phone, :buyer_name)} 
  	end
end
