class UsersController < ApplicationController
  before_action :logged_in_user, only: [:settings_edit, :settings_update,
                                        :images_edit, :images_update, :images_reset,
                                        :category_new, :category_create]
  before_action :correct_user, only: [:settings_edit, :settings_update,
                                      :images_edit, :images_update, :images_reset,
                                      :category_new, :category_create]

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
      log_in(@user)
      flash[:success] = "ようこそ！ #{@user.name}さん！"
      redirect_to(root_url)
    else
      render("new")
    end
  end

  def settings_edit
    @user = User.find_by(id: params[:id])
    @settings_class = "active"
    @images_class = ""
    @category_class = ""
  end

  def settings_update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "基本情報を更新しました。"
      redirect_to(settings_edit_path(@user))
    else
      render("settings_edit")
    end
  end

  def images_edit
    @user = User.find_by(id: params[:id])
    @settings_class = ""
    @images_class = "active"
    @category_class = ""
  end

  def images_update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_images_params)
      flash[:success] = "画像を更新しました。"
      redirect_to(images_edit_path(@user))
    else
      render("images_edit")
    end
  end

  def images_reset
    @user = User.find_by(id: params[:id])
    @user.img = "default_img.png"
    @user.header_image = "default_header_image.png"
    if @user.save
      flash[:success] = "画像を初期画像へ戻しました。"
      redirect_to(images_edit_path(@user))
    else
      flash.now[:danger] = "エラーが発生しました。時間をおいてもう一度実行してみてください。"
      render("images_edit")
    end
  end

  def category_new
    @category = Category.new
    @settings_class = ""
    @images_class = ""
    @category_class = "active"
  end

  def category_create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "新しい収支カテゴリを登録しました。"
      redirect_to(category_new_url)
    else
      render("category_new")
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_images_params
    params.require(:user).permit(:img, :header_image)
  end

  def category_params
    params.require(:category).permit(:name, :color, :user_id)
  end

  # before actions
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
