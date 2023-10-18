class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, except: %i[index new create]
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @group_entities = @group.sorted_entities
    @total_amount = @group.total_amount
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    return unless @group.save

    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def set_group
    @group = Group.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
