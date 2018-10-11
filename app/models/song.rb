class Song < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable_class
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres
end
