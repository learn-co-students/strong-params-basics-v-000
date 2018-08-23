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
	  # @post = Post.new(params["post"]) - before stong params
	  # @post = Post.new(params.require(:post).permit(:title, :description)) - with strong params 
	  @post = Post.new(post_params) # DRY strong params
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  # @post.update(params["post"]) - before stong params
	  # @post.update(params.require(:post).permit(:title)) - with strong params 
	  @post.update(post_params) # DRY strong params
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	
	private
 
	def post_params
  		params.require(:post).permit(:title, :description)
	end

end
