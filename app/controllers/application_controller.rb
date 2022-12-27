class ApplicationController < ActionController::Base
  def welcome
    render html: "Welcome to Alicja's shop!"
    add_flash_types :danger, :info, :warning, :success, :messages
  end
end
