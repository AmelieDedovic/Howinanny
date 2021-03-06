class MessagesController < ApplicationController
  before_action :set_conversation_id_for_create, only: [:create]

  def create

    @message = Message.new(message_params)
    @message.conversation = @conversation
    if current_nanny.nil?
       @message.user_type = "user"
     else
     @message.user_type = "nanny"
    end
    # @message.user_type = "user"
    # if @message.save && current_user
    #   redirect_to nanny_conversations_path(@conversation.nanny)
    # else @message.save && current_nanny
    #   redirect_to nanny_space_conversation_path(@conversation)
    # end
    if @message.save && current_user
      redirect_to nanny_conversations_path(@conversation.nanny)
    else @message.save && current_nanny
      redirect_to nanny_space_conversation_path(@conversation)
    end
  end

  private

  # def set_conversation
  #   @conversation = Conversation.find(params[:conversation_id])
  # end

  def set_conversation_id_for_create
    @conversation = Conversation.find(params[:message][:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
