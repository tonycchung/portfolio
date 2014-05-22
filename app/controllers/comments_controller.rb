class CommentsController < ApplicationController
  before_action :load_posts
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = @post.comments.build
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to [@post, @comment], notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def load_posts
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :content, :approved, :post_id)
  end

end
