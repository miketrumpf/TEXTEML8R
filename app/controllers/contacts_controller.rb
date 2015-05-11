class ContactsController < ApplicationController


  def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
      format.html {}
      format.json {render json: @contact}
    end
  end

  def new
    @contact = Contact.new
  end

  # not redirecting to the right place. how is this going to connect with join table method?
  def create
    @contact = Contact.new(contact_params)
    @contact.save

    binding.pry

     current_user.contacts << @contact

    if @contact
      respond_to do |format|
        format.html { redirect_to user_path(current_user.id) }
        format.json { render json: @contact}
      end
    else
      respond_to do |format|
        format.html {render :new}
        format.json {render json: {error: "error"}, status: 422}
      end
    end
  end

  def edit
    @contact = Contact.find(params[:id])

  end

  def update
    @contact = Contact.find(params[:id])

    @contact.update(contact_params)

    respond_to do |format|
      format.html {redirect_to user_path(@user.id)}
      format.json {render json: @user}
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    @contact.destroy

    respond_to do |format|
      format.html {redirect_to user_path(@user.id)}
      format.json { render json: @user}
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :phone_number)
  end




end