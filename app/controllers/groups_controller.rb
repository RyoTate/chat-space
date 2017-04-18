class GroupsController < ApplicationController
  before_action :get_group, only: [:edit, :update]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループが保存できませんでした"
      render action: :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを更新しました"
    else
      flash.now[:alert] = "グループを更新できませんでした"
      render action: :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def get_group
    @group = Group.find(params[:group_id])
  end
end
