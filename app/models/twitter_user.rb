class TwitterUser < ActiveRecord::Base
 has_many :tweets

 def self.find_by_username(username)
   if TwitterUser.exists?(twitter_username: username)
    TwitterUser.find_by(twitter_username: username)
   else
   	TwitterUser.create(twitter_username: username)
   end
 end

 def fetch_tweets!
	 	self.tweets.destroy_all
	  $twitter_client.user_timeline(self.twitter_username, count: 10).each do |pulled_tweet|
	    self.tweets.create(tweet_id: pulled_tweet.id, tweet_text: pulled_tweet.text)
	  end
 end

  def stale?
		last_updated_at = self.tweets.last.updated_at
		diff_time = Time.now - last_updated_at
		if diff_time > 900
		 true
		else
		 false
		end
 	end

end