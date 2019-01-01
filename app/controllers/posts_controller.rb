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
	#	@post = Post.new(params.require(:post).permit(:title, :description)) "Add Strong Params"
	#	@post.save
	#	redirect_to post_path(@post)

	#  @post = Post.new(params["post"])  "original code"
	#  @post.save
	#  redirect_to post_path(@post)
	end

	def update
		@post = Post.find(params[:id])   #  "Adding Post Params Method"
		@post.update(post_params(:title))  #  Only passing in title for update, no change in description
		redirect_to post_path(@post)

		# @post = Post.find(params[:id])   "Adding Strong Params"
		# @post.update(params.require(:post).permit(:title))
		# redirect_to post_path(@post)

	 # @post = Post.find(params[:id])  "Original Code"
	 # @post.update(params["post"])
	 # redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end

private

	def post_params(*args)
		params.require(:post).permit(*args)  # *args instead of (:title, :description)
	end

# We pass the permitted fields in as *args;
# this keeps `post_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action
