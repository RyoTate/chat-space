class MessagesController < ApplicationController
  before_action :get_group, only: [:index, :create]
  def index
    @groups = current_user.groups.includes(:users)
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id]).order(created_at: :DESC).includes(:user)
    @users = @group.users
  end

  def new
  end

  def create
    @message = Message.new(create_params)
    redirect_to group_messages_path(@group) if @message.save
  end

  private
  def create_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  end
  def get_group
    @group = Group.find(params[:group_id])
  end
