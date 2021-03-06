require_relative './music'
require_relative '../modules/common_checks'
require_relative '../modules/json_handler'

class MusicCollection
  attr_reader :album

  include CommonChecks
  include JsonHandler

  def initialize
    @album = load_json(File.join(File.dirname(__FILE__), '../json/music.json'))
  end

  def add(genre_collection, label_collection, author_collection)
    id = verify_int(message: 'Please enter an ID: ', error: 'Wrong type. Please enter a valid integer')
    published_date = verify_date(message: 'Enter a publish date as follows [yyyy-mm-dd]: ',
                                 error: 'Wrong Format. Enter again [yyyy-mm-dd]: ')
    on_spotify = yes_or_not(message: 'Is this track on Spotify (Y/N) ')
    music = MusicAlbum.new(on_spotify, id, published_date)
    music.label = label_collection.get
    music.genre = genre_collection.get
    music.author = author_collection.get
    @album << music
    puts
    puts 'Music Track create succesfully. Press enter to continue'
    gets.chomp
  end

  def list
    @album.each_with_index do |music, index|
      print "#{index}) Label: #{music.label.title.capitalize}, "
      print "Author: #{music.author.first_name} #{music.author.last_name} "
      puts "Color: #{music.label.color.capitalize}, Genre: #{music.genre.name.capitalize} "
      spotify = music.on_spotify ? 'Track is on Spotify ' : "Track isn't on Spotify "
      print spotify
      print ", Published on #{music.published_date.strftime('%a %d %b %Y')}"
    end
    puts
  end
end
