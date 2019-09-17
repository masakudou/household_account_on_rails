class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.img = "default_img.png"
    @user.header_image = "default_header_image.png"
    if @user.save
      log_in @user
      flash[:success] = "ようこそ！ #{@user.name}さん！"
      redirect_to @user
    else
      render('new')
    end
  end

  def settings_edit
    @user = User.find_by(id: params[:id])
  end

  def settings_update
  end

  def images_edit
    @user = User.find_by(id: params[:id])
  end

  def images_update
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
