class PostsController < ApplicationController
  layout 'posting'
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :user_is_logged_in, only: [:new,:edit,:show,:create]
 
  def index
    @posts = Post.all.page(params[:page]).per(4)
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def confirm
    @post = Post.new(post_params)
    render new_post_path if @post.invalid?
  end
  def new
    if params[:back]
      @post=Post.new(post_params)
    else
       @post=Post.new
    end
  end

  def edit
  end
  
  def create
    @post = Post.new(post_params)
    @post.image.retrieve_from_cache! params[:cache][:image]
    @user =User.find_by(id: session[:user_id])
    
      if @post.save
        PostMailer.post_mailer(@user).deliver_later
        redirect_to posts_path, notice: 'Post was successfully created.' 
      else
       render 'new'
      end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
         redirect_to posts_path, notice: 'Post was successfully updated.' 
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :image).merge(user: current_user)
    end
end
