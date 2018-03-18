# Right now I'm trying to submit this lesson to see if my
# New local environment is working or not.  I'm trying to see
# If I can push to githum & also communicate with the Learn.co
# server so the little red doughnuts turn into green doughnuts
# :)
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
	  @post = Post.new(params["post"])
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params["post"])
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end
