class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show 
		@post = Post.find(params[:id])
		@comment = Comment.new
    @comments = @post.comments.all
	end

	def new
		@user = User.find(session[:user_id])
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
	end

  def edit
    @post = Post.find(params[:id])
  end

	def update
		@post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

	private
	def post_params
		params.require(:post).permit(:name, :content, :user_id)
	end
end
