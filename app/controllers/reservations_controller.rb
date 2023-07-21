class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    reservations = @reservations
    @myreservations = current_user.reservations                                                                                                   
  end
  def edit
  end
  def confirm
    @room_info = Room.find(params[:room_id])
    @reservation = @room_info.reservations.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.room_id = @room_info.id

    if @reservation.valid?
      # binding.pry
      render :confirm
    else
      # binding.pry
      @room = @room_info
      render 'rooms/show'
    end

  end

  def new
    @reservation = Reservation.new
  end

 
  def create
    @room_info = Room.find(params[:room_id])
    @reservation = @room_info.reservations.new(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      redirect_to room_reservations_path
    else
      
    end
  end

  def destroy
    @reservation = Room.find(params[:id])
    @reservation.destroy
    flash[:notice] = "当該施設を削除しました"
    redirect_to room_reservations_path
  end


  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :person, :room_id)
  end 
end

