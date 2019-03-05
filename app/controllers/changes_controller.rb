class ChangesController < ApplicationController
  def index
    @changes = Change.all
  end

  def show
    @change = Change.find(params[:id])
  end

  def new
    @stocks = Stock.all
    @change = Change.new
  end

  def create
    @change = Change.new(change_params)

    if @change.save
      redirect_to changes_path
    else
      render 'new'
    end

  end

  def edit
    @change = Changes.find(params[:id])
  end

  def update
    @change = Change.find(params[:id])

    if @change.update(change_params)
      redirect_to changes_path
    else
      render 'edit'
    end

  end

  def destroy
    @change = Change.find(params[:id])
    @change.destroy
    redirect_to changes_path
  end

  private
    def change_params
      params.require(:change).permit(:id, :amount, :type, :stock_id)
    end
end
