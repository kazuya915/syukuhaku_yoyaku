class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @rooms = Room.all
  end

  def myrooms
    @rooms = Room.all
    rooms = @rooms
    @myrooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    # @reservation = current_user.reservations.create(reservation_params)
    # redirect_to root_path notice:"予約が完了しました"
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def search
    @results = @q.result
    
  end
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "当該施設を削除しました"
    redirect_to :myrooms_rooms
  end


  private

  
  def set_q
    @q = Room.ransack(params[:q])
  end

  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :price, :address, :room_image, :image )
  end
  
end
