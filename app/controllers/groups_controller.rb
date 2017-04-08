class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to root_path
  end

  private
  def post_params
    params.require(:sample_form).permit(users: [])
  end

  def group_params
    params.require(:group).permit(:name, { user_ids:[] })
  end
end
