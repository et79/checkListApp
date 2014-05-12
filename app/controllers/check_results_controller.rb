class CheckResultsController < ApplicationController
    
    # def update
    # 	@project = Project.find(params[:project_id])
    # 	@check_result = @project.check_results.find(params[:id])
    # 	@check_result.update(check_result_comment_params)

    # 	redirect_to(:back)

    # end

    # def toggle
    #     # render nothing: true
    # 	@check_result = CheckResult.find(params[:id])
    # 	@check_result.done = !@check_result.done
    # 	@check_result.save

    #     redirect_to(:back)
    # end

    private

		def check_result_comment_params
			params[:check_result].permit(:comment)
		end
end
