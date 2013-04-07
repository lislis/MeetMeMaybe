class LandingController < ApplicationController

	def home
		if current_user
			@friend_requests = current_user.received_friend_requests
		end
	end

end