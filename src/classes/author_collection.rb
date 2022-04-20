require_relative './author'
require_relative './type_collection'

class AuthorCollection < TypeCollection
  def initialize
    super
    create_defaults if @list.length.zero?
  end

  def get
    choice = super
    if choice == 1
      display
      index = verify_index(@list)
      @list[index]
    else
      create_author
    end
  end

  def display
    puts
    @list.each_with_index do |author, index|
      puts "#{index}) First Name: #{author.first_name},  Last Name: #{author.last_name}"
    end
  end

  private

  def create_author
    id = verify_int(message: 'Author ID: ', error: 'Please input correct numeric id: ')
    first_name = verify_str(message: 'Author First Name: ', error: 'Please input a string for First Name: ')
    last_name = verify_str(message: 'Author Last Name: ', error: 'Please input a string for Last Name: ')
    author = Author.new(id, first_name, last_name)
    @list << author
    author
  end

  def create_defaults
    author1 = Author.new(1, 'Stephen', 'King')
    author2 = Author.new(2, 'John', 'Smith')
    @list.push(author1, author2)
  end
end
