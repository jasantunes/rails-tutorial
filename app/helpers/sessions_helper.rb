module SessionsHelper

  # Logs in the given user.
  # Because temporary cookies created using the session method are automatically
  # encrypted, this code is secure and there is no way for an attacker to use
  # the session information to log in as the user.
  # Note that this is not the case for persistent sessions created using the
  # cookies method.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  # Using User.find_by (instead  of User.find) because if user is not logged in
  # it will return nil (instead of raising an exception).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

end
