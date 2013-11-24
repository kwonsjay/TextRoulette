class UsersController < ApplicationController
  def new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to user_url
    else
      redirect_to new_session_url
    end
  end
  
  def show
    render :show
  end
end
