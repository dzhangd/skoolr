class SchoolsController < ApplicationController
	def index
		@schools = School.all
	end

	def show
		@school = School.find(params[:id])
	end

	def new
		@school = School.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@school = School.new(school_params)

		if @school.save
			redirect_to @school
		else
			render 'new'
		end
	end

	def update
		@school = School.find(params[:id])

		if @school.update(school_params)
			redirect_to @school
		else
			render 'edit'
		end
	end

	private
		def school_params
			params.require(:school).permit(:name, :address)
		end
end
