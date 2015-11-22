class BrowseController < ApplicationController

	def index
		@schools = School.all
	end

	def show
		@school = School.find(params[:id])
		if (params[:search])
			@schools = School.search(params[:search])
		else
			@schools = School.all
		end
		render 'index'
	end
	

end
