class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show 
		@post = Post.find(params[:id])
	end

	def new
		@user = User.find(session[:user_id])
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@user = User.find(session[:user_id])
		@user.posts << @post
		respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
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
