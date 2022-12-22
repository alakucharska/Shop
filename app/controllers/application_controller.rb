class ApplicationController < ActionController::Base
  def welcome
    render html: "Welcome to Alicja's shop!"
  end
end
