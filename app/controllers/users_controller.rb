class UsersController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  before_filter :set_user, only: ['show','edit','update','destroy']
  
  def index
    @users = User.order(sort_column + " " + sort_direction)
  end
  
  def new
    @user = User.new
    @form_path = users_path
  end
  
  def create
    @user = User.new(param_user)
    @roles = Role.all
    if @user.save
      flash[:success] = "User created successfully"
      redirect_to users_path
     else
       flash[:error] = "Unable to create user"
       render 'new'
    end
  end
  
  def show
  end
  
  def edit
    @form_path = user_path(@user)
  end
  
  def update
    if @user.update(param_user)
      flash[:success] = "User updated successfully"
      redirect_to @user
    else
      @form_path = user_path(@user)
      flash[:error] = "Failed to update user"
      render 'edit'
    end
  end
  
  def destroy
    if @user.destroy
      flash[:success] = "User deleted successfully"
     else
      flash[:error] = "Failed to delete user"
    end
    redirect_to users_path
  end
  
  private
  
  def param_user
    params.require(:user).permit(:first_name, :last_name, :role, :mail_id, :password, :password_confirmation)
  end 
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
