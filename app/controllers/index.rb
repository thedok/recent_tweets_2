get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
	@user = TwitterUser.find_by_username(params[:username])
	if @user.tweets_stale?
	 @user.fetch_tweets!
	 puts 'Fetched tweets from API!!!!!!!!!!'
  end
  @tweets = @user.tweets.limit(50)
 erb :index
end