class CreditCardsController < ApplicationController
  def index
    @cards = CreditCard.all
  end

  def new
    @card = CreditCard.new
  end

  def create
    @card = CreditCard.new credit_card_params
    if @card.save
      flash[:success] = "Credit Card successfully saved"
      redirect_to credit_cards_path
    else
      flash[:error] = @card.errors.full_messages
      render :new
    end
  end

  def destroy
    @card = CreditCard.find params[:id]
    if @card.destroy
      flash[:success] = "Credit Card successfully removed"
      redirect_to credit_cards_path
    else
      flash[:error] = "Credit Card can't be removed"
    end
  end

  private

  def credit_card_params
    params.require(:credit_card).permit :card_number, :expiration_date, :security_code
  end
end

