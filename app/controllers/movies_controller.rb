class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def new
		@movie = Movie.new
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def create
		@movie = Movie.new(movie_params)

		if @movie.save
			flash[:success] = "Movie has been added to the database successfully"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def update
		@movie = Movie.find(params[:id])

		if @movie.update_attributes(movie_params)
			flash[:success] = "Movie has been edited in the database successfully"
			redirect_to root_url
		else
			render 'edit'
		end
	end

	def destroy
		@movie = Movie.find(params[:id])

		if @movie.destroy
			flash[:success] = "Movie has been deleted from the database successfully"
			redirect_to root_url
		end
	end

	private

		def movie_params
			params.require(:movie).permit(:title, :description, :rating)
		end
end
