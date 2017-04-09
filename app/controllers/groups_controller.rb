class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    review = current_user.reviews.new(review_params)
    if review.save
      redirect_to rool_path, notice: "グループを作成しました"
    else
      redirect_to new_group_path,  dander: "グループが保存できませんでした"
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, { user_ids:[] })
  end
end
