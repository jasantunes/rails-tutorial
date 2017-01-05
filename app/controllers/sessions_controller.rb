class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      puts "User " + params[:session][:email] + " logged in"
    else
      # Create an error message.
      puts "User " + params[:session][:email] + " not logged in"
    end
  end

end
