class CreateTwitterUsersTable < ActiveRecord::Migration
  def change
  	create_table :twitter_users do |t|
  		t.string :twitter_username
  		t.integer :twitter_user_id

  		t.timestamps
  	end
  end
end



