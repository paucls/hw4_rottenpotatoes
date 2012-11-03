require 'spec_helper'

describe MoviesController do
  it 'Find similar movies action calls model' do
    fake_movie = mock('Movie')
    Movie.stub(:find).with("1").and_return(fake_movie)
    fake_movie.should_receive(:find_by_same_director)
    post :find_similar_movies, {:id => 1}
  end
  
  it 'Find similar movies action calls model without director' do
    movie = Movie.new
    Movie.stub(:find).with("1").and_return(movie)
    post :find_similar_movies, {:id => 1}
    response.should redirect_to(:controller => 'movies', :action => 'index')
  end
  
  it 'Destroy action calls model and redirect to index' do
    movie = Movie.new
    Movie.stub(:find).and_return(movie)
    movie.should_receive(:destroy)
    delete :destroy, {:id => 1}
    response.should redirect_to(:controller => 'movies', :action => 'index')
  end
end