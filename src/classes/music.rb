class MusicAlbum < Item
  attr_reader :spotify

  def initialize(spotify, id, date)
    super(id, date)
    @spotify = spotify
  end

  def move_to_archive
    false
  end
end
