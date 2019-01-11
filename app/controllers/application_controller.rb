class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?

	  protected

	def configure_permitted_parameters
	  added_attrs = [ :name, :introduction, :image,:telephone,:postcode,:area_id,:address,:email, :password, :password_confirmation,:kind_id,images_images: []]
	  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	end
end
