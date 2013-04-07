class ProfilesController < ApplicationController

	before_filter :authenticate_user!

	def show
		# take the parameter from url
		user_name = params[:id]
		# find user, 'find_by' method is dynamically generated
		@user = User.find_by_user_name(user_name)
		@already_sent = FriendRequest.exists?(:from_id => current_user.id, :to_id => @user.id)

	end

end