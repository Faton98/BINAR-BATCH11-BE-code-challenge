class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction  = Transaction.new
    @stocks       = Stock.all
  end
  
  def create

    step          = params[:step]
    
    if step == 'preview'
      total     = 0
      @keranjang = params[:keranjang]
      @keranjang.each do |index, val| 
        item  = Stock.find_by(id: index)
        total += (val.to_i * item.hargaBarang) 
      end

      @bayar = total
      @transaction  = Transaction.new

    elsif step == 'save'

      @transaction = Transaction.new(transaction_params)

      if @transaction.save

        keranjang = params[:keranjang]
        keranjang.each do |index, val| 
          Detail.create(transaction_id: @transaction.id, stock_id: index, amount:val )
        end

        redirect_to transactions_path
      else
        render 'new'
      end
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to transactions_path
    else
      render 'edit'
    end

  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to transactions_path
  end

  private
    def transaction_params
      params.require(:transaction).permit(:idTransaction, :dateTransaction, :totalTransaction)
    end
end
