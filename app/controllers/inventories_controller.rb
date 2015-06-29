class InventoriesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @user = User.find_by_id(params[:user_id])
    @user_inventories = @user.inventories.order(sort_column + " " + sort_direction)
  end
  
  def showAll
    @inventories = Inventory.all.order(sort_column + " " + sort_direction)
    render 'showall'
  end
  
  def new
    @form_path = user_inventories_path(params[:user_id])
    @inventory = Inventory.new()
    @user = User.find_by_id(params[:user_id])
    session[:user_id] = @user['id']
  end
  
  def create
    @inventory = Inventory.new(inventory_param)
    @inventory[:user_id] = session[:user_id]
    if @inventory.save!
       flash[:success] = "Inventory created successfully"
       session[:user_id] = nil
       redirect_to inventories_path
    else
       flash[:error] = "Unable to create inventory"
       render 'new'
    end
  end
  
  def show
    
  end
  
  def update
    
  end
  
  def edit
    
  end
  
  def delete
    
  end
  
  private
  
  def sort_column
    Inventory.column_names.include?(params[:sort]) ? params[:sort] : "purchase_date"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def inventory_param
    params.require(:inventory).permit(:user_id, :description, :item_type, :purchase_date, :amount_cents)
  end
end
