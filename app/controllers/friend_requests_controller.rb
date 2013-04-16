class FriendRequestsController < ApplicationController
	def create
		to = params[:friend_request][:to] #get the "to" 
		user = User.find(to) # find the user
		FriendRequest.create(:from => current_user, :to => user) # create the friend request from us to them
		redirect_to profile_path(user.user_name) #instead of rendering the view it gives other route 
	end
	def update #we will get an id of the friend request and the state
	  
	  id = params[:id] # get the id
	  state = params[:friend_request][:state] #get the state 
	  request = FriendRequest.find(id) #model - get the id form the object 
	  if request.to == current_user
  	  request.state = state
  	  request.save
	  end
	  redirect_to root_path
	  
	end

end