class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => :show

  def index
    @users = User.all
  end

  def show
  	if params[:id]
    	@user = User.find_by(id: params[:id])
    else
    	@user = User.find_by(name: params[:nombre])
    end
  end

end
