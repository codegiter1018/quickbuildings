class BuildingsController < ApplicationController
  before_action :set_building, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index]
  before_action :contributor_confirmation, only: [:new,:create,:edit, :update, :destroy]


  def index
    @building = Building.includes(:user)
  end

  def new
   @building = Building.new
  end 

  def create
     
    @building = Building.new(building_params)
    if @building.save
     redirect_to root_path
   else
     render :new
   end
 end  

 def show
  @building = Building.find(params[:id])
   @comment = Comment.new
   @comments = @building.comments
end

def edit
  @building = Building.find(params[:id])
end

def update
  @building = Building.find(params[:id])
  if @building.update(building_params)
    redirect_to building_path
  else
    render :edit
  end
end

def destroy
  @building = Building.find(params[:id])
  @building.destroy
  redirect_to root_path
end



private

  def building_params
    params.require(:building).permit(:prefecture, :buildings_name ,:address ,:completion,:renewal,:description, :image).merge(user_id: current_user.id)
  end

  def set_building
    @building = Building.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.admin == true
  end


end
 
