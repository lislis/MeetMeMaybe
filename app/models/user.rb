class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable
	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :user_name
	validates :user_name, :presence => true
	# attr_accessible :title, :bod	
	# relationship to other models
	has_many :received_friend_requests, :class_name => "FriendRequest", :foreign_key => :to_id
	has_many :sent_friend_requests, :class_name => "FriendRequest", :foreign_key => :from_id
  
  
  def friends 
    #a friend is the user that sends accepted request
    FriendRequest.sent_by(self).accepted.map do |request|
      request.to #
    end
  end
  def full_name
    [first_name, last_name].join(" ")
  end
 

end
