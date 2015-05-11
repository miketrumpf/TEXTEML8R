class TextsController < ApplicationController

# before_filter :fix_params, :only => [:create, :update]
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
    binding.pry
    Time.zone = text_params[:time_zone]
    @text = Text.new({
      content: params[:text][:content],
      contact_id: params[:text][:contact_id].to_i
      })


    time_string = []
 
      time_string.push(params[:appointment]["time(1i)"])
      time_string.push(params[:appointment]["time(2i)"])
      time_string.push(params[:appointment]["time(3i)"])
      time_string.push(params[:appointment]["time(4i)"])
      time_string.push(params[:appointment]["time(5i)"])


      time = Time.new(time_string[0], time_string[1], time_string[2], time_string[3], time_string[4])

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
      format.html {redirect_to user_path(current_user.id)}
      format.json {render json: @user}
    end
  end

  def text_params
    params.require(:text).permit(:content, :phone_number, :time,  :user_id, :contact_id)
  end

private

  # def fix_params
  #   time = []
  
    
  #     time.push(params[:appointment]["time(1i)"])
  #     time.push(params[:appointment]["time(2i)"])
  #     time.push(params[:appointment]["time(3i)"])
  #     time.push(params[:appointment]["time(4i)"])
  #     time.push(params[:appointment]["time(5i)"])
      
  
    
  # end





end