class CommentsController < ApplicationController
	def show
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.find(session[:user_id])
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		# @user = User.find(session[:user_id])
		# @comment.user_id = @user.id
		# @post = Post.find(params[:post_id])
		# @comment.post_id = @post.id
		@comment.save
		redirect_to @comment.post
	end

	def edit
		@post = Comment.find(params[:id])
	end

	private
	def comment_params
		params.require(:comment).permit(:name, :content, :user_id, :post_id)
	end
end
