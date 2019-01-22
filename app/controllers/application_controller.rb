class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!




	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username])
	end

	 def after_sign_in_path_for(resource)

    	user_path(resource)

  	end

  	def after_sign_out_path_for(resource)

    	root_path(resource)

  	end
end
