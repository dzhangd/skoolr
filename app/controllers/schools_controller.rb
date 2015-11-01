class SchoolsController < ApplicationController
	def new
	end

	def create
		@school = School.new(school_params)

		@school.save
		redirect_to @school
	end

	private
		def school_params
			params.require(:school).permit(:name, :address)
		end
end
