class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def songs
    Song.all.select {|song_obj| song_obj.genre == self}
  end

  def self.all
    @@all
  end

  def artists
    songs.map {|song| song.artist}.uniq
  end
end
