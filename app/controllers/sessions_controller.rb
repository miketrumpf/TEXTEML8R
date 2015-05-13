class SessionsController < ApplicationController

  def new

  end

  def create 
    username = params[:username]
    password = params[:password]

    user = User.find_by username: username

    if user && user.authenticate(password)

      session[:current_user] = user.id
      respond_to do |format|
        format.html {redirect_to "/users/#{current_user.id}"}
        format.json {render json: :show}
      end
    else
      respond_to do |format|
        format.html {render :new}
        format.json {render json: {error: "Wrong Ish"}}
      end
    end
  end

  def destroy
    session[:current_user] = nil
    respond_to do |format|
      format.html {redirect_to sessions_new_path}
      format.json {render nothing: true}
    end
  end






end