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
	# -- for require the params that gets passed in must contain a key called "post".
	def create         				#-- the post key
	  # @post = Post.new(params.require(:post).permit(:title, :description))
		@post = Post.new(post_params)
	  @post.save
	  redirect_to post_path(@post)
	end

	# -- permit only allows for the specified attribute to altered and saved by the user. In this case only the title.
	def update
		# @post.update(params.require(:post).permit(:title))
	  @post = Post.find(params[:id])
	  @post.update(post_params)
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
