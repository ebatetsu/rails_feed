class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :following, :followers]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 30)
  end


  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザー登録されました。"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールが更新されました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = @user.name + "アカウントを削除しました。"
    redirect_to root_url
  end

  def following
    @title = "フォロー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :image
      )
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user.admin? || current_user?(@user)
        redirect_to(root_url)
      end
    end
end
