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
		# NOTE : The below is replaced with the second below because modified the "config/application.rb" file to not allow all inputs
		# @post = Post.new(params["post"])
		# @post = Post.new(params.require(:post).permit(:title, :description))
		# NOTE : Replaced the above with the below to DRY the Create/Update methods
		# @post = Post.new(post_params)
		# NOTE : Replaced the above with the below because (in this case) want the params to be different between Create and Update
		@post = Post.new(post_params(:title, :description))


	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])

		# NOTE : The below is replaced with the second below because modified the "config/application.rb" file to not allow all inputs
	  # @post.update(params["post"])
		# @post.update(params.require(:post).permit(:title))
		# NOTE : Replaced the above with the below to DRY the Create/Update methods
		# @post.update(post_params)
		# NOTE : Replaced the above with the below because (in this case) want the params to be different between Create and Update
		@post.update(post_params(:title))

	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end


	private

	# NOTE : Used to abstract out and DRY (Do Not Repeat) the Create/Update methods
	# def post_params
	#   params.require(:post).permit(:title, :description)
	# end

	# NOTE : This is an updated version of the above method for the purpose of using different params between Create and Update
	def post_params(*args)
	  params.require(:post).permit(*args)
	end



end
