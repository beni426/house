class PropertysController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :set_nearest_stations, only: [:show, :edit, :update]
  def index
    @propertys=Property.all
   end
   def new
     @property=Property.new
     2.times { @property.nearest_stations.build }
   end
   def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      if @property.save
        redirect_to propertys_path, notice: "新しい物件を登録しました!"      
      else
        2.times { @property.nearest_stations.build }
        render :new
      end
    end
  end
   
   def show
    binding.pry
   end
   def edit
     @property.nearest_stations.build
   end
   def update
    if @property.update(property_params)
     redirect_to propertys_path, notice: "物件情報を編集しました！"
    else
      @property.nearest_stations.build
     render :edit
    end
   end
   def destroy
     @property.destroy
     redirect_to propertys_path, notice:"物件を削除しました！"
   end
   private
   def property_params
   
     params.require(:property).permit(
       :property_name,
       :rent,
       :address,
       :age,
       :memo,
       nearest_stations_attributes:  %i[ route_name station time ],
      )
   end
   def set_property
     @property = Property.find(params[:id])
   end
   def set_nearest_stations
    @nearest_stations=@property.nearest_stations
   end
 end
 
