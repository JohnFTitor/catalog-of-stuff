require_relative './book_collection'
require_relative './label_collection'
require_relative './genre_collection'
require_relative './music_collection'
require_relative './author_collection'

class App
  def initialize
    @book_collection = BookCollection.new
    @game_collection = []
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
    when 4 then @genre_collection.list
    when 5 then @label_collection.list
    when 6 then @author_collection.list
    end
    print "\nPress Enter to return"
    gets.chomp
    system('clear')
  end

  def add_tasks(num)
    case num
    when 7 then @book_collection.add(@label_collection)
    when 8 then @music_collection.add(@genre_collection, @label_collection)
    when 9 then @game_collection.add(@genre_collection, @label_collection, @author_collection)
    end
  end
end
