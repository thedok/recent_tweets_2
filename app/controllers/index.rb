get '/' do
  # Look in app/views/index.erb
end

get '/test' do
	unless @user = TwitterUser.find_by_username(params[:username])
		@user = TwitterUser.create(username: params[:username]) 
		@user.fetch_tweets!
	end
	@tweets = @user.tweets.limit(50)
	erb :_tweets, layout: false
end


get '/:username' do
	 unless @user = TwitterUser.find_by_username(params[:username])
	 	@user = TwitterUser.create(username: params[:username])
	 	@user.fetch_tweets!
	 end
		if @user.tweets_stale?
		 @user.fetch_tweets!
		 puts 'Fetched tweets from API!!!!!!!!!!'
	  end
	  @tweets = @user.tweets.limit(50)

	 erb :index
end




# get '/:username/ajax' do
# 	@user = TwitterUser.find_by_username(params[:username])
# 		if @user.tweets_stale?

# 		 # @user.fetch_tweets!
# 		 # puts 'Fetched tweets from API!!!!!!!!!!'
# 	  end
# 	  @tweets = @user.tweets.limit(50)
# 	erb :_tweets
# end


