class ApplicationController < ActionController::Base
  add_flash_types :primary, :secondary, :success, :danger, :warning, :info
end
