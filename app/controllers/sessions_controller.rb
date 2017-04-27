class SessionsController < ApplicationController
  # GET /login
  def new
    render :new
  end

  # POST /login
  def create
    @user = User.find_by(name: params[:name])
    if @user.present? && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_path
    end
  end

  # DELETE /logout
  def destroy
    reset_session
    redirect_to root_path
  end
end
