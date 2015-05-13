class TextsController < ApplicationController


  def index
    @texts = Text.where({
      user_id: current_user.id
      })
  end

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


    time_string = []
 
      time_string.push(params[:appointment]["time(1i)"])
      time_string.push(params[:appointment]["time(2i)"])
      time_string.push(params[:appointment]["time(3i)"])
      binding.pry
      edt = (params[:appointment]["time(4i)"])
      utc_hour = edt.to_i + 4
      utc_str = utc_hour.to_s

      time_string.push(utc_str)

      time_string.push(params[:appointment]["time(5i)"])


      time = Time.new(time_string[0], time_string[1], time_string[2], time_string[3], time_string[4])
    @text.sent = false,
    @text.time = time
    contact = Contact.find(params[:text][:contact_id])
    @text.phone_number = contact.phone_number.to_i


    @text.user_id = current_user.id

 
    #grab user_id and contact_id and phone numbers if possible here and add it to @text then save


    @text.save
  
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
      format.html {redirect_to texts_path}
      format.json {render json: @user}
    end
  end

  def text_params
    params.require(:text).permit(:content, :from_number, :to_number, :user_id, :contact_id)
  end


end