class PagesController < ApplicationController


	def home
	end
	
	def search
	end
	
	def browse
		@schools = School.all
	end
	
	def login
	end
	
	def admin
	end

end
