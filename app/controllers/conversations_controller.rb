class ConversationsController < AuthenticatedController
  before_action :set_nanny

  def index
    @conversation = Conversation.find_or_create_by(user_id: current_user.id, nanny_id: @nanny.id)
    @conversation.user = current_user
    @conversation.nanny = @nanny
    @messages = @conversation.messages.order(:created_at)
  end

  private

  def set_nanny
    @nanny = Nanny.find(params[:nanny_id])
  end
end
