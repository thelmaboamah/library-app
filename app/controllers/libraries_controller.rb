class LibrariesController < ApplicationController

	before_action :set_library, only: [:show, :update, :destroy, :edit]

	def index
		@libraries = Library.all
	end

	def new
		@library = Library.new
	end

	def create
		@library = Library.create(library_params)
		redirect_to libraries_path 
	end

	private
		def library_params
			params.require(:library).permit(:name, :floor_count, :floor_area)
		end

		def set_library
			@library = Library.find(params[:id])
		end

end
