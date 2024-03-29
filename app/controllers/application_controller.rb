class ApplicationController < ActionController::Base
	protect_from_forgery

	helper_method :current_user

	private

	def current_user
		begin
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		rescue ActiveRecord::RecordNotFound
			return false
		end	
	end
	
end
