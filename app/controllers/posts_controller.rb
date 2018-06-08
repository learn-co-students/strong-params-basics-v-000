class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		set_post
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
	  set_post
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  set_post
	end
	
	private
	
	def set_post
		@post = Post.find(params[:id])
	end
	
	def post_params(*args)
	  params.require(:post).permit(*args)
	end
end
