class User < ActiveRecord::Base
	mount_uploader :logo, LogoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :products
	
	# returns a url
	def wepay_authorization_url(redirect_uri)
  		Shopketti::Application::WEPAY.oauth2_authorize_url(redirect_uri, self.email, self.company_name)
	end

	# takes a code returned by wepay oauth2 authorization and makes an api call to generate oauth2 token for this farmer.
	def request_wepay_access_token(code, redirect_uri)
  		response = Shopketti::Application::WEPAY.oauth2_token(code, redirect_uri)
  		if response['error']
    		raise "Error - "+ response['error_description']
  		elsif !response['access_token']
    		raise "Error requesting access from Shop Ketti"
  		else
    		self.wepay_access_token = response['access_token']
    		self.save
  		end
	end

	def has_wepay_access_token?
  		!self.wepay_access_token.nil?
	end

	# makes an api call to WePay to check if current access token for farmer is still valid
	def has_valid_wepay_access_token?
  		if self.wepay_access_token.nil?
   	return false
  	end
  		response = ShopKetti::Application::WEPAY.call("/user", self.wepay_access_token)
  		response && response["user_id"] ? true : false
	end

	# takes a code returned by wepay oauth2 authorization and makes an api call to generate oauth2 token for this farmer.
	def request_wepay_access_token(code, redirect_uri)
  		response = ShopKetti::Application::WEPAY.oauth2_token(code, redirect_uri)
  		if response['error']
    		raise "Error - "+ response['error_description']
  		elsif !response['access_token']
    		raise "Error requesting access from Shop Ketti"
  		else
    		self.wepay_access_token = response['access_token']
    		self.save

			#create WePay account
    		self.create_wepay_account
  		end
	end


	def has_wepay_account?
  		self.wepay_account_id != 0 && !self.wepay_account_id.nil?
	end

	# creates a WePay account for this farmer with the farm's name
	def create_wepay_account
  		if self.has_wepay_access_token? && !self.has_wepay_account?
    		params = { :name => self.company_name, :description => self.company_description }			
    		response = ShopKetti::Application::WEPAY.call("/account/create", self.wepay_access_token, params)

    	if response["account_id"]
      	self.wepay_account_id = response["account_id"]
      	return self.save
    	else
      	raise "Error - " + response["error_description"]
    	end

  	end		
  	raise "Error - cannot create WePay account"
end
end
