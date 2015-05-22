class ContactsController < ApplicationController

  #show current users contacts
  def index

    @contacts = current_user.contacts
    
  end

  #show individual contact
  def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.html {}
      format.json {render json: @contact}
    end
  end

  #go to new contact form
  def new
    @contact = Contact.new
  end

  # create new contact 
  def create
    @contact = Contact.new(contact_params)
    @contact.save

    #linking current user and its contact on join table
     current_user.contacts << @contact

    if @contact
      respond_to do |format|
        format.html { redirect_to "/users/#{current_user.id}" }
        format.json { render json: @contact}
      end
    else
      respond_to do |format|
        format.html {render :new}
        format.json {render json: {error: "error"}, status: 422}
      end
    end
  end

  #edit contact form
  def edit
    @contact = Contact.find(params[:id])

  end
  #update edited contact
  def update
    @contact = Contact.find(params[:id])

    @contact.update(contact_params)

    respond_to do |format|
      format.html {redirect_to "/users/#{current_user.id}"}
      format.json {render json: @user}
    end
  end

  #destroy contact
  def destroy
    @contact = Contact.find(params[:id])

    @contact.destroy

    respond_to do |format|
      format.html {redirect_to user_path(@user.id)}
      format.json { render json: @user}
    end
  end

  #whitelist
  def contact_params
    params.require(:contact).permit(:name, :phone_number)
  end




end