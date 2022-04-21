require_relative './author'
require_relative './type_collection'
require_relative '../modules/json_handler'

class AuthorCollection < TypeCollection
  include JsonHandler
  attr_reader :list

  def initialize
    super
    @list = create_defaults
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
    authors = load_json(File.join(File.dirname(__FILE__), '../json/author.json'))
    if authors.empty?
      @list.push(author1, author2)
    else
      @list = authors
    end
  end
end
