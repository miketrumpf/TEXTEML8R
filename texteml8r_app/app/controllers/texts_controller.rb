class TextsController < ApplicationController


  def show
    @text = Text.find(params[:id])
    respond_to do |format|
      format.html {}
      format.json { render json: @text}
    end
  end


  def new
    @text = Text.new
  end


  def create
    @text = Text.new({
      content: params[:text][:content],
      contact_id: params[:text][:contact_id].to_i
      })
    contact = Contact.find(params[:text][:contact_id])
    @text.to_number = contact.phone_number.to_i

    @text.from_number = current_user.phone_number.to_i

    @text.user_id = current_user.id

 
    #grab user_id and contact_id and phone numbers if possible here and add it to @text then save


    @text.save
    binding.pry
    if @text.save
      respond_to do |format|
        format.html { redirect_to "/texts/#{@text.id}"}
        format.json {render json: @user}
      end
    else 
      respond_to do |format|
        format.html {render :new}
        format.json {render json: {error: "wrong info"}, status:422}
      end
    end
  end

  def destroy
    @text = Text.find(params[:id])

    @text.destroy

    respond_to do |format|
      format.html {redirect_to user_path(current_user.id)}
      format.json {render json: @user}
    end
  end

  def text_params
    params.require(:text).permit(:content, :from_number, :to_number, :user_id, :contact_id)
  end


end