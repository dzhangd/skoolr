class PagesController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", only: [:admin]

	def home
	end
	
	def search
	end
	
	def browse
	end
	
	def login
	end
	
	def admin
	end

end
