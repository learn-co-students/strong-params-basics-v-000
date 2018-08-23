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
	  @post = Post.new(post_params(:title, :description)) # DRY strong params using a private method below
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  # @post.update(params["post"]) - before stong params
	  # @post.update(params.require(:post).permit(:title)) - with strong params 
	  @post.update(post_params(:title)) # DRY strong params using a private method below
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

# Add a private method to DRY up strong params code to use in the create and update methods above
# We pass the permitted fields in as *args;
# this keeps `post_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action
	
	private 
 
	def post_params(*args) 
  		params.require(:post).permit(*args)
	end

end
