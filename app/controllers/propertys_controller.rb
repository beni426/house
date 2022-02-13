class PropertysController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @propertys=Property.all
   end
   def new
     @property=Property.new
   end
   def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      if @property.save
        redirect_to propertys_path, notice: "新しい物件を登録しました!"      
      else
        render :new
      end
    end
  end
   
   def show
   end
   def edit
   end
   def update
    if @property.update(property_params)
     redirect_to propertys_path, notice: "物件情報を編集しました！"
    else
     render :edit
    end
   end
   def destroy
     @property.destroy
     redirect_to propertys_path, notice:"物件を削除しました！"
   end
   private
   def property_params
     params.require(:property).permit(:property_name,:rent,:address,:age,:memo)
   end
   def set_property
     @property = Property.find(params[:id])
   end
 end
 
