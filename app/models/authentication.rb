class Authentication < ActiveRecord::Base

  belongs_to :user

  def twitter_client
    client = Twitter::Client.new(
      :oauth_token => self.oauth_token,
      :oauth_token_secret => self.oauth_token_secret
     )
  end

  def self.from_omniauth(user, auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |authentication|
      authentication.user = user
      authentication.provider = auth.provider
      authentication.uid = auth.uid
      authentication.name = auth.info.name
      authentication.oauth_token = auth.credentials.token
      authentication.oauth_expires_at = Time.at(auth.credentials.expires_at)
      authentication.save!
    end
  end

end