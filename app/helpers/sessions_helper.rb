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

end
