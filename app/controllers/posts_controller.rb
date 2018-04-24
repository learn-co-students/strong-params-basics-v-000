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
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private

	#we don't have to duplicate the strong parameters for create and update, we can just use the following method.
	#we pass the permitted fields in as *args; this keeps the 'post_params' pretty dry while still allowing slightly different behavior depending on the controller action.
	def post_params(*args)
		params.require(:post).permit(*args)
	end
end
