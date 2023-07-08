class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]

  def index
    @user = User.find(current_user.id)
    @rooms = Room.all
    @rooms = @user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id))
    if @room.save
      flash[:notice] = "施設が作成されました。"
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduction, :price, :address, :image))
      flash[:notice] = "施設情報が更新されました。"
      redirect_to room_path
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設が削除されました。"
    redirect_to :rooms
  end

  def search
    @rooms = Room.all
    if params[:word].present?
      @rooms = @rooms.where('name LIKE ? OR introduction LIKE ?', "%#{params[:word]}%", "%#{params[:word]}%")
    end
    if params[:area].present?
      @rooms = @rooms.where('address LIKE ?', "%#{params[:area]}%")
    end
  end
end
