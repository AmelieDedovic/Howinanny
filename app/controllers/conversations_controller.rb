class ConversationsController < ApplicationController
  before_action :set_nanny
  def show
    @conversation = Conversation.find(params[:id])
    @conversation.user = current_user
    @conversation.nanny = @nanny
    @conversation.messages
  end

  private

  def set_nanny
    @nanny = Nanny.find(params[:nanny_id])
  end
end
