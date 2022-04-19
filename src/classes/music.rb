class MusicAlbum < Item
  attr_reader :spotify

  def initialize(spotify, id, date)
    super(id, date)
    @spotify = spotify
  end

  private

  def can_be_archived?
    super && @spotify
  end
end
