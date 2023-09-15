# frozen_string_literal: true

class ConversationUsersController < ApplicationController
  before_action :set_conversation, only: %i[create]
  before_action :set_conversation_user, only: %i[show edit update destroy]
  before_action :set_users

  def create # rubocop:disable  Metrics
    @conversation_user = ConversationUser.new(conversation_user_params)
    user1 = ConversationUser.where(user_id: @conversation_user.user_id)
    user2 = ConversationUser.where(user_id: current_user.id)
    conversation = Conversation.where(conversation_users: user1).and(Conversation.where(conversation_users: user2))
                               .and(Conversation.where(private: true))
    if !params[:conversation_id] && conversation.present?
      redirect_to(conversation_messages_path(conversation.last))
    else
      unless params[:conversation_id]
        @current_user_conversation_user.save
        @conversation.save
        @conversation_user.conversation = @conversation
      end

      respond_to do |format|
        if @conversation_user.save
          if @conversation.present?
            format.html { redirect_to(conversation_messages_path(@conversation)) }
          else
            format.html { redirect_back(fallback_location: root_path) }
          end
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /conversation_users/1 or /conversation_users/1.json
  def destroy
    @conversation_user.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private

  def set_conversation
    return if params[:conversation_id]

    @conversation = Conversation.new
    @current_user_conversation_user = ConversationUser.new(user: current_user, conversation: @conversation)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_conversation_user
    @conversation_user = ConversationUser.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def conversation_user_params
    params.permit(:user_id, :conversation_id)
  end
end
