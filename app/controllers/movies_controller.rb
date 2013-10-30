class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = ['G','PG','PG-13','R']
    @movies = get_movies_filtered(params)
    @sort_column = params[:column]
    @sort_order = params[:sort]
    @selected_ratings = (params[:ratings] && params[:ratings].keys) || session[:rating_keys] || []
    session[:sort_column] = @sort_column
    session[:sort_order] = @sort_order
    session[:rating_keys] = params[:ratings].keys if params[:ratings]
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end


  def get_movies_filtered params
    puts session

    sort_order = params[:sort] || session[:sort_order]
    sort_column = params[:column] || session[:sort_column]
    sort_string = "#{sort_column} #{ sort_order}"
    rating_criteria =  (params[:ratings] && params[:ratings].keys) || session[:rating_keys]
    movies = Movie.order(sort_string)
    if rating_criteria.present?
      return movies.where(:rating => rating_criteria) 
    else
      return movies
    end
  end
end
