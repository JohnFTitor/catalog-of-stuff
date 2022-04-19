require_relative './book.rb'
require_relative '../modules/common_input.rb'

class BookCollection
  def attr_reader @books
  include CommonInput

  def initialize
    @books = []
  end

  def add(genre_coll, label_coll author_coll)
    id = verify_int(message: 'ID: ', error: 'Please input correct numeric id: ' )
    publish_date = verify_date(message: 'Publish Date [yyyy-mm-dd]: ', error: 'Please input date in the correct format: ')
    publisher = verify_publisher(message: "Publisher: ", error: "Please input a string: ")
    cover_state = verify_cover_state
    genre = genre_coll.get
    book_label = label_coll.get
    book_author = author_coll.get
    new_book = Book.new(publisher, cover_state, id, publish_date)
    new_book.genre= genre
    new_book.author= author
    new_book.label= label
    @books << new_book
  end

  def list
    puts @books
  end

  private
  def verify_cover_state
    print "How is the state of the cover? [Good/Bad] :"
    cover_state = gets.chomp.strip.downcase
    while (cover_state != 'good' && cover_state != 'bad')
      print 'Please input Good or Bad: '
      cover_state = gets.chomp.strip.downcase
    end
    cover_state
  end

end