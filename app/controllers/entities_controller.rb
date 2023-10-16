class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, except: %i[index new create]
  def index
    @entities = Entity.all
  end

  def new
    @entity = Entity.new
  end

  def show
    @entity = Entity.all
  end

  def create
    puts "ID: #{params[:group_id]}"

    @entity = Entity.new(entity_params)
    @entity.user = current_user
    @group = Group.find(params[:group_id])
    puts "IDG: #{@group.id}"
    @entity.save
    @group_entity = GroupEntity.new(entity_id: @entity.id, group_id: @group.id)
    @group_entity.save
    if @entity.save
      redirect_to group_path(params[:group_id])
    else
      redirect_to groups_path
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end

  def set_entity
    @entity = Entity.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
