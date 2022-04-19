class MusicAlbum < Item
  attr_reader :spotify

  def initialize(spotify, id, date)
    @spotify = spotify
  end
end
