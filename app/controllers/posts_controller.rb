class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def confirm
    @post = Post.new(post_params)
    if @post.invalid?
      render :new 
    end
  end
  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "J'ai créé un post!"
      else
        # Redessinez le formulaire de saisie.
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Nous avons édité le post !"
    else
      render :edit
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path, notice:"Nous avons supprimé votre post !"
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end