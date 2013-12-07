class StaticPagesController < ApplicationController
  def home
  end

  def story
  end

  def invite
  end

  def wish
	redirect_to new_guest_path
  end
  
  def pictures
  end
  
  def live
  end
end
