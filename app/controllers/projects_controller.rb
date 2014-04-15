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
		@project.save
		Check.all.each do |c|
			@project.check_results.create(check_id: c.id)
		end

		redirect_to projects_path
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
