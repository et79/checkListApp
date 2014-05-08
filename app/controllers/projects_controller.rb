class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
		if @project.tag_list.count > 0 then
			@checks = Check.tagged_with( @project.tag_list.join(",") )
		else
			@checks = Check.all
		end
	end

	def create
		@project = Project.new(project_params_title)
		@project.user_id = current_user.id
	
		# チェック項目を追加
		Check.all.each do |c|
			@project.check_results.build(check_id: c.id)
		end

		@project.save

		redirect_to projects_path
	end

	def edit
		@project = Project.find(params[:id])
	end

    def update
		@project = Project.find(params[:id])
		
		if params[:from_show]
			# チェック項目の更新

			@project.update(project_params)
			@project.update_attributes(project_params)

			redirect_to projects_path

		elsif params[:add_tags]
			# タグの追加
			@project.update(project_params_tags)
			redirect_to project_path, :id => params[:id]
		else
			# タイトルの更新
	        if @project.update(project_params_title)
	            redirect_to projects_path
	        else
	            render 'edit'
	        end
	    end
    end

    def toggle
    	if params[:name] == "my_proj_only" then
    		session[:my_proj_only] = !session[:my_proj_only]
    	end

    	# @projects = Project.all
        # redirect_to :action => 'index'
        render :js => "window.location = '/projects'"
    end

    def destroy
		@project = Project.find(params[:id])

		# チェック結果の削除
		@project.check_results.each do |cr|
			cr.destroy
		end
        @project.destroy
        
        redirect_to projects_path
    end

	private
		# プロジェクトのチェック状態更新
		def project_params
			params[:project].permit(
				:check_results_attributes => [:done, :comment, :check_id, :id])
		end

		def project_params_tags
			params[:project].permit(:tag_list)
		end

		# プロジェクトのタイトル更新
		def project_params_title
			params[:project].permit(:title)
		end

end
