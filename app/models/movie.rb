class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def find_by_same_director
    raise ArgumentError, "Movie has no director" if self.director == nil
    return Movie.find_all_by_director(self.director)
  end
end
