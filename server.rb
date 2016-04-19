#server.rb to MovieLovers
require 'imdb'
require 'tilt/erb'
require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development? #evitar tener que reiniciar el servidor en cada cambio
require_relative 'lib/Movie_Finder.rb'

get '/' do
	erb(:index)
end

post '/' do
	search_term = params[:search_term]
	movie_finder = MovieFinder.new
	@search_result = movie_finder.search_poster(search_term)
	@correct_year = movie_finder.quizz(@search_result)
	erb(:show_movies)
end

post '/answer/:year' do
    @answered_year = params[:year].to_i
 	erb(:answers)
end