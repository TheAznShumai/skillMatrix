class ProjectsController < ApplicationController
  load_and_authorize_resource :param_method => :new_project_params

  def new
  end

  def create
    flash.clear
    if @project.save
      flash[:success] = "Project \"#{@project.name}\" has been created."
      redirect_to projects_path
    else
      flash[:error] = @project.errors.full_messages.uniq.join("\n")
      render 'new'
    end
  end

  def index
  end

  def show
    @manager = User.where(:id => @project.project_manager_id).first
  end

  def edit
  end

  def update
    flash.clear
    if @project.update_attributes(new_project_params)
      flash[:success] = "Project \"#{@project.name}\" has been updated."
      redirect_to projects_path
    else
      flash[:error] = @project.errors.full_messages.uniq.join("\n")
      render 'edit'
    end
  end

  def destroy
    flash.clear
    project_name = @project.name
    @project.destroy
    flash[:error] = "Project \"#{project_name}\" has been removed."
    redirect_to projects_path
  end

  def new_project_params
    params.require(:project).permit(:name, :description, :project_manager_id, :status_id, :department)
  end

end
