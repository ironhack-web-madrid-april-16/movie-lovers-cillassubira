#test of class for movie
require 'imdb'
require 'pry'

class MovieFinder
  attr_accessor :movies_with_poster
  def initialize(num_movies_search = 9)
    @movies_with_poster = []
    @num_movies_search = num_movies_search
  end
  def search_poster(term_to_find)
    @movies_with_poster = []
    @term_to_find = term_to_find
    search = search_imdb
    i = 0
	  while (@movies_with_poster.size < @num_movies_search)
	    if(search.movies[i].poster != nil)
		    @movies_with_poster << search.movies[i]
	    end
	    i += 1
    end
    @movies_with_poster
  end
  def search_imdb
     Imdb::Search.new(@term_to_find)
  end

  def quizz(array_of_movies)
    choosing_num = rand(array_of_movies.size)
    array_of_movies[choosing_num].year
  end

end

