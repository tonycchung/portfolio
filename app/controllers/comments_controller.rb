class CommentsController < ApplicationController
  before_filter :load_commentable
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = @commentable.comments.build
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end

  def create
    @comment = @commentable.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commmentable)
        render template: "#{@resources}/show"
      end
    end
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @commentable, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
    # same as Post.find(id) or Project.find(id)
  end

  def comment_params
    params.require(:comment).permit(:author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :content, :approved, :commentable_id)
  end

end
