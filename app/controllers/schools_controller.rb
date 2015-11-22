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
		redirect_to schools_path, notice: "Schools imported."
	end

	def fetch
		School.fetch
		redirect_to schools_path, notice: "Schools imported."
	end

	def favorite
		type = params[:type]
		school = School.find(params[:id])
		if type == "favorite"
			current_user.favorites << school
			redirect_to :back, notice: "You favorited #{school.name}"

		elsif type == "unfavorite"
			current_user.favorites.delete(school)
			redirect_to :back, notice: "Unfavorited #{school.name}"

		else
			redirect_to :back, notice: "Shouldn't get here"
		end
	end

	private
		def school_params
			params.require(:school).permit(:name, :address)
		end
end
