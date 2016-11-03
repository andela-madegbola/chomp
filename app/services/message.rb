class Message
  def self.log_in_error
    "Invalid email/password combination"
  end

  def self.logged_in
    "Welcome to Chomp!"
  end

  def self.logged_out
    "You are now logged out"
  end

  def self.edit_profile_success
    "Your user profile has been updated"
  end

  def self.inactive_link
    "Oops, this link is inactive"
  end

  def self.url_update_success
    "Your URL was successfully updated"
  end

  def self.url_deleted
    "Your URL was successfully deleted"
  end

  def self.unauthorized_user
    "Please log in"
  end

  def self.username_too_long
    "Username is too long"
  end
end
