require_relative './book_collection'
require_relative './label_collection'
require_relative './genre_collection'
require_relative './music_collection'
require_relative './game_collection'
require_relative './author_collection'
require_relative '../modules/json_handler'

class App
  include JsonHandler

  def initialize
    @book_collection = BookCollection.new
    @game_collection = GameCollection.new
    @music_collection = MusicCollection.new
    @genre_collection = GenreCollection.new
    @author_collection = AuthorCollection.new
    @label_collection = LabelCollection.new
  end

  def run(num)
    system('clear')
    case num
    when 1..6
      list_tasks(num)
    when 7..9
      add_tasks(num)
    when 10
      handle_exit
    else
      puts 'Wrong input, Returning to main menu'
    end
  end

  def list_tasks(num)
    case num
    when 1 then @book_collection.list
    when 2 then @music_collection.list
    when 3 then @game_collection.list
    when 4 then @genre_collection.display
    when 5 then @label_collection.display
    when 6 then @author_collection.display
    end
    print "\nPress Enter to return"
    gets.chomp
    system('clear')
  end

  def add_tasks(num)
    case num
    when 7 then @book_collection.add(@genre_collection, @label_collection, @author_collection)
    when 8 then @music_collection.add(@genre_collection, @label_collection, @author_collection)
    when 9 then @game_collection.add(@genre_collection, @label_collection, @author_collection)
    end
  end

  def handle_exit
    write_json('src/json/music.json', @music_collection.album)
    write_json('src/json/books.json', @book_collection.books)
    write_json('src/json/games.json', @game_collection.games)
    write_json('src/json/labels.json', @label_collection.list)
    write_json('src/json/author.json', @author_collection.list)
    write_json('src/json/genres.json', @genre_collection.list)
    'exit'
  end
end
