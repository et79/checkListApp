class ChecksController < ApplicationController

	before_action :set_check, only: [:show, :edit, :update, :destroy ]

	def index
		@checks = Check.all
	end

	def show
	end

	def new
		@check = Check.new		
	end

	def create
		@check = Check.new(check_params)
		@check.user_id = current_user.id
		if @check.save
			redirect_to checks_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @check.update(check_params)
			redirect_to checks_path
		else
			render 'edit'
		end		
	end

	def destroy
		@check.destroy
		redirect_to checks_path
	end


	private

		def check_params
			params[:check].permit(:title, :contents, :tag_list)
		end

		def set_check
			@check = Check.find(params[:id])
		end
end
