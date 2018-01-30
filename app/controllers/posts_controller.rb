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

	def create # instantiate @post instance with title and/or description attributes set from values submitted in 2 permitted fields in form to create post
	  @post = Post.new(post_params(:title, :description)) # argument of #new is params hash (related to Post model) so that attribute values can be set via mass assignment; only title and/or description attributes will be set (from the 2 permitted form fields)
	  @post.save # persist @post instance to DB by inserting its row representation into posts table
	  redirect_to post_path(@post) # redirect to show page that displays the post just created
	end

	def edit
	  @post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id]) # find @post instance by its id attribute value, i.e., whatever replaces :id route variable
	  @post.update(post_params(:title)) # argument of #update is params hash (related to Post model) with only title attribute value assigned from the 1 permitted title field. Save changes to DB.
	  redirect_to post_path(@post) # redirect to show page to show post just edited
	end

	private

	# We pass the permitted fields in as *args;
	# this keeps `post_params` pretty dry while
	# still allowing slightly different behavior
	# depending on the controller action
	def post_params(*args)
	  params.require(:post).permit(*args)
	end
end
