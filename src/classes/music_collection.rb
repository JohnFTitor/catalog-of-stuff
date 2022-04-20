require_relative './music'
require_relative '../modules/common_checks'

class MusicCollection
  include CommonChecks

  def initialize
    @album = []
  end

  def add(_genre_collection, _label_collection)
    id = verify_int(message: 'Please enter an ID: ', error: 'Wrong type. Please enter a valid integer')
    published_date = verify_date(message: 'Enter a publish date as follows [yyyy-mm-dd]: ',
                                 error: 'Wrong Format. Enter again [yyyy-mm-dd]: ')
    on_spotify = yes_or_not(message: 'Is this track on Spotify (Y/N) ')                             
    music = MusicAlbum.new(on_spotify, id, published_date)
    music.label = _label_collection.get
    music.genre = _genre_collection.get
  end
end
