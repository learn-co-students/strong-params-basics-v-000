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
	  #@post = Post.new(params["post"])
	  @post = Post.new(post_params(:title,:description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params(:title))
	  #@post.update(params["post"])
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private #secures the helper method

	def post_params(*args) #is the helper method 

		params.require(:post).permit(*args)
		#uses .require and .permit methods as stronger params to prevent hacks through inspect element right click edit html 
		#require restricts, permit allows, and *args is for the custom arguments
	end
end
