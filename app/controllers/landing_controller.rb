class LandingController < ApplicationController

	def home
		if current_user
		  @friends = current_user.friends
			@friend_requests = current_user.received_friend_requests.pending
		end
	end

end