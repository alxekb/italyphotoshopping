class ApplicationController < ActionController::Base
  require 'faraday'
  require 'faraday_middleware'
  include Pundit

  protect_from_forgery with: :exception
end
