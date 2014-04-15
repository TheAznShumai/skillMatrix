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
  end

  def new_project_params
    params.require(:project).permit(:name, :description, :project_manager_id, :status_id, :department)
  end

end
