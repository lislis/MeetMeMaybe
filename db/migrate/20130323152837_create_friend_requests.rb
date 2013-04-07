class CreateFriendRequests < ActiveRecord::Migration
	def change
		create_table(:friend_requests) do |t|
			
			t.string :state, :null => false
			t.references :from, :class_name => "User"
			t.references :to, :class_name => "User"

			t.timestamps
		end

	end

end
