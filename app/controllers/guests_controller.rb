class GuestsController < ApplicationController

  before_filter :authenticate_admin!, :only => [:index]

  def new
	@guest = Guest.new
  end

  def create
	@guest = Guest.new(guest_params)
	if @guest.save
		flash[:notice] = "Thank you for your wishes! See your message flash on the home screen"
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
	flash[:notice] = "Guest deleted."
	redirect_to wish_path
  end
  
  def show
	#@guest = Guest.find(params[:id])
	@guest = Guest.where(approved: true).first(:order => "RANDOM()")
	render :partial => 'static_pages/wishbox'
  end
  
  def index
	@guests = Guest.paginate(:page => params[:page], :per_page => 30)
  end
  
  def complete
	#Guest.update_all()
	
	#Guest.update_all(["approved=?", true], :id => params[:task_ids])
	Guest.where(id: params[:approved_guest_ids]).update_all(approved: true)
	Guest.where(id: params[:disapproved_guest_ids]).update_all(approved: false)
	redirect_to guests_path
  end
  
  def guest_params
	params.require(:guest).permit(:name, :email, :wish)
  end
end
