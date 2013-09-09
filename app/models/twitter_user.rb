class TwitterUser < ActiveRecord::Base
	has_many :tweets

	def fetch_tweets!
		self.tweets.destroy_all
		Twitter.user_timeline(self.username).each do |tweet|
			self.tweets << Tweet.new(tweet: tweet.text)
		end
	end

	def tweets_stale?
		Time.now - self.tweets.last.created_at > 60
	end
end
