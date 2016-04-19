require File.expand_path('../../lib/Movie_Finder.rb', __FILE__)

RSpec.describe "Movie_Finder" do
	let (:subject) {MovieFinder.new}
	describe ".search_poster" do
		it "returns an array of movies according to a search term" do
	    expect(subject.search_poster("hello")).to be_an(Array)
	  end
	  it "returns an array of movies with poster according to a search term" do
	    expect(subject.search_poster("hello")[0].poster).not_to be(nil)
	  end
	  it "returns an array of movies with poster according to a designated size" do
	    five_movies = MovieFinder.new(5)
	    expect(five_movies.search_poster("hello").size).to be(5)
	  end
	  it "returns an array of movies with poster of size 9 by default" do
	    expect(subject.search_poster("hello").size).to be(9)
	  end
	end
	describe ".quizz" do
		it "it selects a year among array of movies selected" do
			 array_of_movies = subject.search_poster("hello")
			 expect(subject.quizz(array_of_movies)).to be_a_kind_of(Fixnum)
	  end
	end
end
