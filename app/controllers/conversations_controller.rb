class ConversationsController < AuthenticatedController
  before_action :set_nanny

  def index
    # @conversation.nanny = @nanny
    @conversation = Conversation.find_or_create_by(user_id: current_user.id, nanny_id: @nanny.id)
    @conversation.user = current_user
    @messages = @conversation.messages.order(:created_at)
    @message = Message.new
    @reservation = Reservation.new
  end

  private

  def set_nanny
    @nanny = Nanny.find(params[:nanny_id])
  end
end
