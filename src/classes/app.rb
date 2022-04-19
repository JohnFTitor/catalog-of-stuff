class App
  def initialize
    @book_collection = []
    @game_collection = []
    @music_collection = []
    @genre_collection = []
    @author_collection = []
    @label_collection = []
  end

  def run(num)
    if (1..6) == (num)
      list_tasks(num)
    elsif (7..9) == (num)
      add_tasks(num)
    elsif num == 10
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
  end

  def add_tasks(num)
    case num
    when 7 then @book_collection.add(@genre_collection, @label_collection, @author_collection)
    when 8 then @music_collection.add(@genre_collection, @label_collection, @author_collection)
    when 9 then @game_collection.add(@genre_collection, @label_collection, @author_collection)
    end
  end
end
