class SchoolsController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", only: [:edit, :update, :destroy]

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
		@school = School.find(params[:id])
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

	def destroy
		@school = School.find(params[:id])
		@school.destroy

		redirect_to schools_path
	end

	def import
		School.import(params[:file])
		redirect_to schools_path, notice: "Schools Added Successfully"
	end
	
	private
		def school_params
			params.require(:school).permit(:name, :address)
		end
end
