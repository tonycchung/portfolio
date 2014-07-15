class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  # protect_from_forgery :only => [:create, :update, :destroy]


  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      format.html do
        if @project.save
          flash[:notice] = "Project has been created."
          redirect_to projects_path
        else
          flash.now[:error] = "Project could not be saved."
          render :new
        end
      end
      format.js do |format|
        @project.save
      end
    end
  end

  def show
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    @project.update_attributes(project_params)
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was Successfully updated.' }
      format.js {}
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.js {}
    end
  end

  private

    def project_params
      params.require(:project).permit(:name, :technologies_used, :image)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
