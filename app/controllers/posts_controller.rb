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
	  # @post = Post.new(params["post"]) # not secure
		# @post = Post.new(params.require(:post).permit(:title, :description)) #too verbose
		# @post = Post.new(post_params) #slightly inflexible version
		@post = Post.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  # @post.update(params["post"]) #not secure
		# @post.update(params.require(:post).permit(:title)) #too verbose
		# @post.update(post_params)
		@post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private

	# def post_params # a bit inflexible, can't do, create two fields, only allow to fix 1.
	# 	params.require(:post).permit(:title, :description)
	# end

	def post_params(*args) #pass in permitted fields as args.
		params.require(:post).permit(*args)
	end


end
