class CommentsController < ApplicationController
	def show
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.find(session[:user_id])
		@comment = Comment.new
	end

	def create
		@comment = Comment.create(comment_params)
		user = User.find(session[:user_id])
		user.comments << @comment
		post = Post.find(params[:post_id])
		post.comments << @comment
		redirect_to post
	end

	def edit
		@post = Comment.find(params[:id])
	end

	private
	def comment_params
		params.require(:comment).permit(:name, :content, :user_id)
	end
end
