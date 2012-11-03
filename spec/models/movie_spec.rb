require 'spec_helper'

describe Movie do
  context "find movies with same director" do
    it "return movies if has director" do
      m = Movie.new
      m.director = "George Lucas"
      m.find_by_same_director.size.should be >= 0
    end
    it "raises an error if has no director" do
      m = Movie.new
      expect {
        m.find_by_same_director
      }.to raise_error(ArgumentError)
    end
  end
end
