class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user.nil?
      head :not_found
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  
  end

  private
  def user_params
    return params.require(:user).permit(
      :username
    )
  end
end
