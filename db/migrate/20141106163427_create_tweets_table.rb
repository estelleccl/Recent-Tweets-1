class CreateTweetsTable < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.text :tweet_text
  		t.string :tweet_id

  		t.timestamps
  	end
  end
end