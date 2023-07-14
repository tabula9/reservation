class ReservationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @reservations = Reservation.all
    @reservations = @user.reservations
  end

  def new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      @room = Room.find(params[:reservation][:room_id])
      render "rooms/show"
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "施設の予約が完了しました。"
      redirect_to reservations_path
    else
      @room = Room.find_by(params[:reservation][:user_id])
      render "rooms/show"
    end
  end

  def show
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def edit_confirm
    @reservation = Reservation.find(params[:id])
    @reservation.attributes = reservation_params
    if @reservation.invalid?
      render "edit"
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice] = "施設の予約情報を更新しました。"
      redirect_to :reservations
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "施設の予約情報を削除しました。"
    redirect_to :reservations
  end

  private

    def reservation_params
      params.require(:reservation).permit(:check_in, :check_out, :number_p, :user_id, :room_id)
    end
end
