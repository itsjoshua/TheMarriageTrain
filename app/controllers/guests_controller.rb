class GuestsController < ApplicationController

  before_filter :authenticate_admin!, :only => [:index]

  def new
	@guest = Guest.new
  end

  def create
	@guest = Guest.new(guest_params)
	if @guest.save
		flash[:success] = "Thank you for your wishes! See your message flash on the home screen"
		redirect_to root_path
	else
		render 'new'
	end
  end

  def edit
	@guest = Guest.find(params[:id])
  end

  def update
	@guest = Guest.find(params[:id])
	if @guest.update_attributes(guest_params)
	
		redirect_to root_path
	else
		render 'edit'
	end
 end

  def destroy
	Guest.find(params[:id]).destroy
	flash[:success] = "Guest deleted."
	redirect_to wish_path
  end
  
  def show
	#@guest = Guest.find(params[:id])
	@guest = Guest.first(:order => "RANDOM()")
	render :partial => 'static_pages/wishbox'
  end
  
  def index
	@guests = Guest.paginate(:page => params[:page], :per_page => 30)
  end
  
  def guest_params
	params.require(:guest).permit(:name, :email, :wish)
  end
end
