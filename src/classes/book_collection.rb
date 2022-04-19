require_relative './book.rb'
require_relative '../modules/common_input.rb'

class BookCollection
  include CommonInput

  def initialize
    @books = []
  end

  def add(genre_coll, label_coll author_coll)
    id = verify_id
    publish_date = verify_publish_date
    publisher = verify_publisher
    cover_state = verify_cover_state
    genre = genre_coll.get
    book_label = label_coll.get
    book_author = author_coll.get
    new_book << Book.new(publisher, cover_state, id, publish_date)
  end

  private
  def verify_publisher
    print "Publisher: "
    publisher = gets.chomp.strip.capitalize
  end

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