class Admins::RegistrationsController < Devise::RegistrationsController


def new
	if Admin.all.size > 2
		flash[:notice] = "Admin limit has been reached"
		redirect_to root_path
	else
		super
	end
end




end