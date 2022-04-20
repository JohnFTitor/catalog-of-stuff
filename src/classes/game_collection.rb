require_relative './game'
require_relative '../modules/common_checks'

class GameCollection
  include CommonChecks

  def initialize
    @games = []
  end

  def add(label_coll, author_coll)
    id = verify_int(message: 'ID: ', error: 'Please input correct numeric id: ')
    publish_date = verify_date(message: 'Publish Date [yyyy-mm-dd]: ',
                               error: 'Please input date in the correct format: ')
    multiplayer = yes_or_not(message: 'Is this game a Multiplayer (Y/N): ')
    last_played_at = verify_date(message: 'Last Played Date [yyyy-mm-dd]: ',
                                 error: 'Please input date in the correct format: ')
    new_game = Game.new(multiplayer, last_played_at, id, publish_date)
    # new_book.genre= genre_coll.get
    new_game.author = author_coll.get
    new_game.label = label_coll.get
    @games << new_game
    print 'Game Created Successfully. Press enter to continue. '
    gets.chomp
  end

  def list
    system('clear')
    @games.each_with_index do |game, index|
      print "#{index}) Multiplayer: #{game.multiplayer}, Publish Date: #{game.published_date}, "
      print "Last Played at: #{game.last_played_at}, Label: #{game.label.title} \n"
      print "Author: #{game.author.first_name} #{game.author.last_name}\n"
    end
  end
end
