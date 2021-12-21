class UsersController < ApplicationController
  def index

  end

  def login_new
    @user = User.new
  end

  def reg_new
    @user = User.new
  end

  def login_create
    @user = User.find_by_login(params[:user][:login])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to models_path
    else
      redirect_to users_login_path, alert: @user.errors.full_messages.join
    end
  end

  def register_create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to models_path
    else
      redirect_to users_login_path, alert: @user.errors.full_messages.join
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def user_params
    params.require(:user)
          .permit(:login, :password, :password_confirmation)
  end
end
