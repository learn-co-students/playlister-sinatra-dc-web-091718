class Genre < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable_class
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres
end
