class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      puts "User " + params[:session][:email] + " logged in"
    else
      # Create an error message.  Use flash.now (instead of just flash),
      # which is specifically designed for displaying flash messages that
      # disappear as soon as there is an additional request.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

end
