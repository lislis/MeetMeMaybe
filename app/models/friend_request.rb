class FriendRequest < ActiveRecord::Base 

  # it needs to start from pending, new concept:) hooks? thinks that happends befor or after..
  # we need to set the default BEFORE 
  
	belongs_to :from, :class_name => "User" #the sender 
	belongs_to :to, :class_name => "User" #the receiver 

	attr_accessible :from, :to #add to every model for security reasons 
	validates :state, :presence => true #state needs to be there when we want to create friends request 

  before_validation :set_default_state #funky hook 
  def set_default_state # define the method 
    self.state ||= :pending #my state is by defauld pending .state ins an attribute in model 
  end
  # scope - only the ones that ...
  scope :pending, where(:state =>"pending") #this is filtering pending 
  scope :accepted, where(:state =>"accepted") #this is filtering accepted
  scope :sent_to, lambda { |user| #function to create the scope
    where(:to_id => user.id) #lambda is anomymus function 
  }
  scope :sent_by, lambda {|user|
    where(:from_id => user.id)
  }
end