class CommentsController < ApplicationController
	def show
		@comment = Comment.find(params[:id])
	end

	def create
		@comment = Comment.create(comment_params)
		user = User.find(session[:user_id])
		user.comments << @comment
		post = Post.find(params[:post_id])
		post.comments << @comment
	end

	private
	def comment_params
		params.require(:comment).permit(:title, :content)
	end
end
