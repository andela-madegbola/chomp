module MessagesHelper
  def log_in_error
    "Invalid email/password combination"
  end

  def logged_in
    "Welcome to Chomp!"
  end

  def logged_out
    "You are now logged out"
  end

  def edit_profile_success
    "Your user profile has been updated"
  end

  def inactive_link
    "Oops, this link is inactive"
  end

  def url_update_success
    "Your URL was successfully updated"
  end

  def url_deleted
    "Your URL was successfully deleted"
  end

  def unauthorized_user
    "Please log in"
  end

  def username_too_long
    "Username is too long"
  end
end