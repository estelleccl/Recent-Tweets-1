class TwitterImporter
  def self.import
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = API_KEYS["development"]["twitter_consumer_key_id"]
      config.consumer_secret     = API_KEYS["development"]["twitter_consumer_secret_key_id"]
      config.access_token        = API_KEYS["development"]["twitter_consumer_access_token_id"]
      config.access_token_secret = API_KEYS["development"]["twitter_consumer_access_token_secret_id"]
    end
    
    Person.where(id: 31..32).each do |person|
       client.user_timeline(person.twitter_id, :count => 10).each do |tweet|
         Tweet.create(people_id: person.id, tweet_id: tweet.id, text: tweet.text )
       end
    end
  end
  def self.fetch(username)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = API_KEYS["development"]["twitter_consumer_key_id"]
      config.consumer_secret     = API_KEYS["development"]["twitter_consumer_secret_key_id"]
      config.access_token        = API_KEYS["development"]["twitter_consumer_access_token_id"]
      config.access_token_secret = API_KEYS["development"]["twitter_consumer_access_token_secret_id"]
    end

    # list = URI.parse("https://twitter.com/#{username}")
    # client.list_timeline(list)
    # client.user("#{username}")
    client.user_timeline("#{username}")

  end
end
