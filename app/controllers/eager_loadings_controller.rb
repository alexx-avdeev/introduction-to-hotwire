class EagerLoadingsController < ApplicationController
  def show; end

  def show_data
    @quote = Quote.collection.aggregate([{ '$sample': { size: 1 } }]).first
    sleep(2)
  end
end
