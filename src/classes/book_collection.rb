require_relative './book'
require_relative '../modules/common_checks'
require_relative '../modules/json_handler'

class BookCollection
  attr_reader :books

  include CommonChecks
  include JsonHandler

  def initialize
    @books = load_json('src/json/books.json')
  end

  def add(genre_coll, label_coll, author_coll)
    id = verify_int(message: 'ID: ', error: 'Please input correct numeric id: ')
    publish_date = verify_date(message: 'Publish Date [yyyy-mm-dd]: ',
                               error: 'Please input date in the correct format: ')
    publisher = verify_str(message: 'Publisher: ', error: 'Please input a string: ')
    cover_state = verify_cover_state
    new_book = Book.new(publisher, cover_state, id, publish_date)
    new_book.genre = genre_coll.get
    new_book.author = author_coll.get
    new_book.label = label_coll.get
    @books << new_book
    print 'Book Created Successfully. Press enter to continue. '
    gets.chomp
  end

  def list
    system('clear')
    @books.each_with_index do |book, index|
      print "#{index}) Publisher: #{book.publisher.capitalize}, Publish Date: #{book.published_date}, "
      print "CoverState: #{book.cover_state.capitalize}, "
      print "Label: #{book.label.title}, Author: #{book.author.first_name} #{book.author.last_name} "
      print "Genre: #{book.genre.name} \n"
    end
  end

  private

  def verify_cover_state
    print 'How is the state of the cover? [Good/Bad]: '
    cover_state = gets.chomp.strip.downcase
    while cover_state != 'good' && cover_state != 'bad'
      print 'Please input Good or Bad: '
      cover_state = gets.chomp.strip.downcase
    end
    cover_state
  end
end
