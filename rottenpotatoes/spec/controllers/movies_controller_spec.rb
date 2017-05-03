require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  
  describe 'Happy path' do
    before :each do
      @test_movie=double(Movie, :title => "Alien", :director => "director", :id => "1")
      Movie.stub(:find).with("1").and_return(@test_movie)
    end
    it 'should call model method that finds similar movies' do
      test_results = [double('Movie'), double('Movie')]
      Movie.should_receive(:similar_directors).with('director').and_return(test_results)
      get :similar, :movie_id => "1"
    end
    it 'should select the similar template for rendering and display results' do
      Movie.stub(:similar_directors).with('director').and_return(@test_movie)
      get :similar, :movie_id => "1"
      response.should render_template('similar')
      assigns(:movies).should == @test_movie
    end
  end
end