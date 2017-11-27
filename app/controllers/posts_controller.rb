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
	  @post = Post.new(post_params) #refactoring to remove repetition. moving code to private
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params) #refactoring to remove repetition. moving code to private
	  redirect_to post_path(@post)
	end

	#this in itself helps w/ strong params but is restrictive. lez refactor again
	# def create
	#   # @post = Post.new(params["post"])
	# 	@post = Post.new(params.require(:post).permit(:title, :description)) #permits user to only edit these
	#   @post.save
	#   redirect_to post_path(@post)
	# end
	#
	# def update
	#   @post = Post.find(params[:id])
	#   # @post.update(params["post"])
	# 	@post.update(params.require(:post).permit(:title)) #permits user to only edit these
	#   redirect_to post_path(@post)
	# end

	def edit
	  @post = Post.find(params[:id])
	end

	private

	def post_params
	  params.require(:post).permit(:title, :description)#if we only want to permit user to change title and desc.
	end
end
