class PostsController < ApplicationController
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

  private
  def post_params
    params.require(:post).permit(:content)
  end
end