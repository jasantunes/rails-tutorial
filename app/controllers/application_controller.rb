class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Implementing sessions will involve defining a large number of related
  # functions for use across multiple controllers and views.
  # Conveniently, a Sessions helper module was created automatically when
  # generating the Sessions controller. Moreover, such helpers are automatically
  # included in Rails views; by including the module here, in the base class of
  # all controllers, we are making them available in our controllers as well. 
  include SessionsHelper
  
end
