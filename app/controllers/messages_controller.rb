class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @users = User.all
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      flash[:notice] = "Message was created successfully!"
      redirect_to messages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      flash[:notice] = "Message was updated successfully!"
      redirect_to messages_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice] = "Message was deleted successfully!"
    redirect_to message_path
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
