class UsersController < ApplicationController
  layout 'posting', except: [:index,:new,:create]
  def index
    @user = User.new
  end
  def new
    @user = User.new
  end
  def create
     @user = User.new(user_params)
     if @user.save
       redirect_to new_session_path, notice: "You have created new account!"
     else
       render 'new'
     end
  end
  def edit
    
  end
  
  def show
    @user = User.find_by(id: session[:user_id])
    #@user = User.find_by(id:params[:id])
    @post=@user.favorite_posts#.page(params[:page]).per(2)
  end
  def update
   @user=User.find(params[:id])
   if params[:password].blank?
    params.delete(:password)
   end
    if @user.update(update_params)
      redirect_to user_path, notice: "Profile added successfully"
    else
      render 'show'
    end
  end
  def favorites_list
    @user = User.find_by(id:params[:id])
    @post=@user.favorite_posts#.page(params[:page]).per(2)
  end
  private
  
  def user_params
    params.require(:user).permit(:email,:names,:username,:password)
  end
  def update_params
    params.require(:user).permit(:image)
  end
end
