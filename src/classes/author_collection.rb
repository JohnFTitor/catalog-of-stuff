require_relative './author'
require_relative './type_collection'

class AuthorCollection < TypeCollection
  def initialize
    super
    create_defaults if @list.length.zero?
  end

  def list
    puts
    @list.each_with_index do |author, index|
      puts "#{index}) First Name: #{author.first_name},  Last Name: #{author.last_name}"
    end
  end

  private

  def create_defaults
    author1 = Author.new(1, 'Stephen', 'King')
    author2 = Author.new(2, 'John', 'Smith')
    @list.push(author1, author2)
  end
end
