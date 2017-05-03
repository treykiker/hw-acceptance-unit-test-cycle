require 'spec_helper'
require 'rails_helper'

describe Movie do
  describe 'searching similar directors' do
    it 'should call Movie with director' do
      Movie.should_receive(:similar_directors).with('Alien')
      Movie.similar_directors('Alien')
    end
  end
end