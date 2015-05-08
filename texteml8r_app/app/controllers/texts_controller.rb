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
    @text = Text.new(text_params)
    #grab user_id and contact_id if possible here and add it to @text then save


    @text.save

    if @text.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user.id)}
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
      format.html {redirect_to user_path(current_use.id)}
      format.json {render json: @user}
    end
  end

  def text_params
    params.require(:text).permit(:content, :from_number, :to_number, :user_id, :contact_id)
  end


end