class InvoicesController < ApplicationController
  def index; end

  def new
    invoices = Invoices.new
  end

  def create
    @invoices = Invoice.new(invoices_params)
    if @invoices.save
      redirect_to(controller: 'items', action: 'index')
    else
      puts 'sorry'
    end
  end

  private

  def invoices_params
    params.require(:invoices).permit(:item_name, :item_price, :item_quatity, :item_id)
  end
end