require 'pry'

class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		binding.pry
	end

	def create
	  p params
	  @post = Post.new(params.require(:post).permit(:title, :description))
	  @post.save
	  binding.pry
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post).permit(:title, :description, :post_status, :author_id))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end
