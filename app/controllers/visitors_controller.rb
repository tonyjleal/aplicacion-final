class VisitorsController < ApplicationController

	def index
		if current_user
			@users = User.where.not(:email => current_user.email)
		else
			@users = User.all
		end
		@users = @users.paginate(:page => params[:page], :per_page => 6)
	end

end
