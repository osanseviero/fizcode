class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :index] 
  before_action :admin_user, only:[:index]
  before_action :correct_user,   only: [:edit, :update]
  def index
  	@user = User.all
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Registrado"
      redirect_to courses_path
    else
      flash.now[:danger] = 'Los datos que ingresaste son invalidos' 
      render '/welcome/index'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user  = User.find(params[:id]) # en caso de que la update sea exitosa se entra en el if y se hace la update
    if @user.update_attributes(user_params)
      flash[:success] = 'Se ha actualizado la cuenta'
      redirect_to courses_path
    else
      flash.now[:danger] = 'Los datos que ingresaste son invalidos'
      render 'edit'
    end
  end 

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = 'Usuario borrado'
    redirect_to users_path
  end

def admin_user
    redirect_to (root_url), flash[:danger] = "Solo admins" unless current_user.admin?
end

def logged_in_user
  unless logged_in?
      flash[:warning] = "Por favor ingrese su cuenta"
      redirect_to root_url
  end
end

def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless @user == current_user
end
  
    private
  	def user_params
  		params.require(:user).permit(:name,:mail,:password, :password_confirmation)
  	end
    end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Por favor ingrese su cuenta"
      redirect_to courses_path
  end
end