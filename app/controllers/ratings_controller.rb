class RatingsController < ApplicationController

	def create
		@school = Article.find(params[:id]);
		@rating = @school.ratings.create(rating_params)
	end
	
	private
	def rating_params
		params.require(:rating).permit(:user, :value)
	end

end
