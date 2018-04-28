class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(person)
    musician = Artist.find_or_create_by_name(person)
    if musician.is_a? Artist
      self.artist = musician
      self.artist.add_song(self)
    else
      self.artist = Artist.new(musician.join)
      self.artist.add_song(self)
    end
  end

  def self.new_by_filename(filename)
    file = filename.split(" - ")
    song = Song.new(file[1])
    song.artist_name = file[0]
    song
  end
end
