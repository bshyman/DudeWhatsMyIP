class ApplicationController < ActionController::Base
  include InterfacesHelper
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session



 
end
