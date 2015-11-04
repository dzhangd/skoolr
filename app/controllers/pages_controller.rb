class PagesController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", only: [:admin]

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
