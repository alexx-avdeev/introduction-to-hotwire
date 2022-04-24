class EagerLoadingsController < ApplicationController
  def show; end

  def show_data
    sleep(5)
  end
end
