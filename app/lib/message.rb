class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.welcome
    'Welcome'
  end

  def self.fav
    'Book has been added to your favourites'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.forbidden
    'Signature has expired'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end
end