class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
		@checks = Check
	end

	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		if @project.save
			Check.all.each do |c|
				@project.check_results.create(check_id: c.id)
			end
		end

		redirect_to projects_path
	end

	def edit
		@project = Project.find(params[:id])
	end

    def update
		@project = Project.find(params[:id])
        if @project.update(project_params)
            redirect_to projects_path
        else
            render 'edit'
        end
    end

    def destroy
		@project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
    end

	private
		def project_params
			params[:project].permit(:title)
		end

end
