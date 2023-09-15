# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_conversation
  before_action :set_users

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    @message.user = current_user
    return unless @message.save

    ActionCable.server.broadcast 'conversation_channel', { content: @message.content, username: @message.user.username,
                                                           id: @message.user.id, conversation: @message.conversation.id,
                                                           style: message_style(@message) }
  end

  private

  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id, :conversation_id)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end

  def message_style(message)
    return unless message.user == current_user || message.conversation.private?

    'none'
  end
end
