class FriendRequestsController < ApplicationController
	def create
		to = params[:friend_request][:to]
		user = User.find(to)
		FriendRequest.create(:from => current_user, :to => user)
		redirect_to profile_path(user.user_name)
	end

end