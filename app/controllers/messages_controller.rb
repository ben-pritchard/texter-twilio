class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
    # binding.pry
      respond_to do |format|
        format.html { redirect_to messages_path }
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.js
    end
  end

private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
