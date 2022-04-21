require_relative './game'
require_relative '../modules/common_checks'
require_relative '../modules/json_handler'

class GameCollection
  attr_reader :games

  include CommonChecks
  include JsonHandler

  def initialize
    @games = load_json(File.join(File.dirname(__FILE__), '../json/games.json'))
  end

  def add(genre_coll, label_coll, author_coll)
    id = verify_int(message: 'ID: ', error: 'Please input correct numeric id: ')
    publish_date = verify_date(message: 'Publish Date [yyyy-mm-dd]: ',
                               error: 'Please input date in the correct format: ')
    multiplayer = yes_or_not(message: 'Is this game a Multiplayer (Y/N): ')
    last_played_at = verify_date(message: 'Last Played Date [yyyy-mm-dd]: ',
                                 error: 'Please input date in the correct format: ')
    new_game = Game.new(multiplayer, last_played_at, id, publish_date)
    new_game.genre = genre_coll.get
    new_game.author = author_coll.get
    new_game.label = label_coll.get
    @games << new_game
    print 'Game Created Successfully. Press enter to continue. '
    gets.chomp
  end

  def list
    system('clear')
    @games.each_with_index do |game, index|
      print "#{index}) Label: #{game.label.title}, Author: #{game.author.first_name} #{game.author.last_name}\n"
      print "Genre: #{game.genre.name}, Multiplayer: #{game.multiplayer}, Last Played at: #{game.last_played_at}\n"
      print "Publish Date: #{game.published_date}\n\n"
    end
  end
end
