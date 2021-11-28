class ChangesController < ApplicationController
  def new
    @change = Change.new
    @rand_price = rand(501..9999)
  end

  def create
    @change = Change.new(change_params)
    if @change.save
      redirect_to change_path(@change)
    else
      render :new
    end
  end

  def show
    change = Change.find(params[:id])
    @result = change.pay - change.price

    @thousand = @result / 1000
    @fivehun = (@result - (@thousand * 1000)) / 500
    @hundred = (@result - (@thousand * 1000) - (@fivehun * 500)) / 100
    @ten =     (@result - (@thousand * 1000) - (@fivehun * 500) - (@hundred * 100)) / 10
    @five =    (@result - (@thousand * 1000) - (@fivehun * 500)- (@hundred * 100) - (@ten * 10)) / 5
    @one =     (@result - (@thousand * 1000) - (@fivehun * 500)- (@hundred * 100) - (@ten * 10) - (@five * 5))
  end
  
  private

  def change_params
    params.require(:change).permit(:price, :pay)
  end
end
