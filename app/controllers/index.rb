get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
	@user = TwitterUser.find_by_username(params[:username])
	if (@user.tweets.empty? || @user.stale?)
  	@user.fetch_tweets!
 	end
 @tweets = @user.tweets
 erb :show
end