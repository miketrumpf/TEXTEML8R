class UsersController < ApplicationController



  #need to change this so index is for this particular user
  def index
    @users = User.all

    respond_to do |format|
      format.html{}
      format.json {render json: @users}
    end
  end

  def show
    @user = User.find(params[:id])
    @texts = Text.where({user_id: current_user.id})
    respond_to do |format|
      format.html{}
      format.json {render json: @user}

    end
  end

  # new user form view
  def new
    @user = User.new
  end
  # runs on submit
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html {redirect_to sessions_new_path}
        format.json {render json: @user}
      end
    else
      respond_to do |format|
        format.html {render :new}
        format.json {render json: {error: "wrong info"}, status:422}
      end
    end 
  end

  # def add_contact
  #   user = User.find(params[:id])
  #   contact = Song.find(params[:contact_id])

  #   user.add_contact(contact)

  #   respond_to do |format|
  #     format.html {redirect_to user_path(@user.id)}
  #     format.html {rend json: @user}
  #   end
  # end

def user_params
  params.require(:user).permit(:username, :password, :phone_number)
end


end