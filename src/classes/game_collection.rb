require_relative './game'
require_relative '../modules/common_checks'

class GameCollection
  include CommonChecks

  def initialize
    @games = []
  end

  def add(_label_coll, _author_coll)
    id = verify_int(message: 'ID: ', error: 'Please input correct numeric id: ')
    publish_date = verify_date(message: 'Publish Date [yyyy-mm-dd]: ',
                               error: 'Please input date in the correct format: ')
    multiplayer = yes_or_not(message: 'Is this game a Multiplayer (Y/N): ')
    last_played_at = verify_date(message: 'Last Played Date [yyyy-mm-dd]: ',
                                 error: 'Please input date in the correct format: ')
    new_game = Game.new(multiplayer, last_played_at, id, publish_date)
  end
end
