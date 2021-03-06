class MessagesController < ApplicationController
  before_action :get_group, :get_groups, :get_messages, only: [:index, :create]

  def index
    @message = Message.new
    @users = @group.users
  end

  def create
    @message = Message.new(create_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to group_messages_path(@group)
    else
      flash.now[:alert] = "メッセージが保存できませんでした"
      render action: :index
    end
  end


  private

  def create_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end

  def get_group
    @group = Group.find(params[:group_id])
  end

  def get_groups
    @groups = current_user.groups.includes(:users)
  end

  def get_messages
    @messages = Message.current_group(params[:group_id]).last_created.includes(:user)
  end
end
