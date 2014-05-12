class UsersController < ApplicationController
  load_and_authorize_resource :user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
        redirect_to root_path, notice: "Thank you for signing up!"
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def manage
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

end