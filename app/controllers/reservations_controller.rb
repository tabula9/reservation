class ReservationsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number_p, :user_id))
    if @reservation.save
      flash[:notice] = "施設の予約が完了しました。"
      redirect_to :reservations
    else
      reder "rooms/show"
    end
  end

  def show
  end

  def edit
    @reservation = Reservation.find(params.id)
  end

  def update
    @reservation = Reservation.find(params.id)
    if @reservation.update(params.require(:reservation).permit(:check_in, :check_out, :number_p))
      flash[:notice] = "施設の予約情報を更新しました。"
      redirect_to :reservations
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params.id)
    @reservation.destroy
    flash[:notice] = "施設の予約情報を削除しました。"
    redirect_to :reservations
  end
end
