class QuotesController < ApplicationController
  before_action :set_quotes, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quotes.all
  end

  def show
  end

  def new
    @quote = Quotes.new
  end

  def create
    @quote = Quotes.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "Quote saved successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote deleted successfully"
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
