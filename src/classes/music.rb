class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, id, published_date)
    super(id, published_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
