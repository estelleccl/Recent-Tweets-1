class CreateTwitterUsersTable < ActiveRecord::Migration
  def change
  	create_table :twitter_users do |t|
  		t.string :twitter_username

  		t.timestamps
  	end
  end
end



