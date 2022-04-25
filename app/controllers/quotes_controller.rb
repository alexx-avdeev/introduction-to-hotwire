class QuotesController < ApplicationController
  before_action :setup, only: %i[destroy edit show update]

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      flash.now[:success] = 'Quote created successfully'
      respond_to do |format|
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update('new_quote', partial: 'form', locals: { quote: @quote }) }
      end
    end
  end

  def destroy
    if @quote.destroy
      respond_to do |format|
        flash.now[:success] = "Quote deleted"
        format.turbo_stream
      end
    else
      respond_to do |format|
        flash.now[:danger] = "Failed to delete"
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@quote) }
      end
    end
  end

  def edit; end

  def index
    @quotes = Quote.all.order_by(created_at: -1)
  end

  def new
    @quote = Quote.new
  end

  def show
    render @quote
  end

  def update
    if @quote.update(quote_params)
      flash.now[:success] = "Quote updated"
      respond_to do |format|
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update(@quote, partial: 'form', locals: { quote: @quote }) }
      end
    end
  end

  private

  def quote_params
    params
      .require(:quote)
      .permit(
        :author,
        :text
      )
  end

  def setup
    @quote = Quote.find(params[:id]) if params[:id].present?
  end
end
