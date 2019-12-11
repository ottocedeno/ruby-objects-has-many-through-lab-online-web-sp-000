require 'pry'

class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select {|song_obj| song_obj.artist == self}
  end

  def new_song(name, genre)
    new_song = Song.new(name, self, genre)
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end
end
