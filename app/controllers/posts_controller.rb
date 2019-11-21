class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params(:title))
    redirect_to post_path(@post)
    
    # Note: If I try to maliciously change the description here,
    # it does nothing to the post, and it does NOT raise a ForbiddenAttributesError.
    # This is true even if I submit a param with an invalid name (description instead of post[description]).
    # However, as mentioned in the lesson, if I don't have a :post key in the params, 
    # it fails with an error (ActionController::ParameterMissing, in this case).
	end

	def edit
	  @post = Post.find(params[:id])
  end
  
  private

  def post_params(*args)
    params.require(:post).permit(*args)
  end
end
