json.extract! user, :id, :provider, :uid, :name, :oauth_token, :auth_expires_at, :nick, :email, :hp, :lvl, :experience, :gold, :attack, :defence, :strength, :agility, :created_at, :updated_at
json.url user_url(user, format: :json)
