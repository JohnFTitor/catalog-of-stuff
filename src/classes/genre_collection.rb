require_relative './type_collection'
require_relative './genre'
require_relative '../modules/json_handler'

class GenreCollection < TypeCollection
  include JsonHandler
  attr_reader :list

  def initialize
    super
    @list = generate_defaults
  end

  def display
    @list.each_with_index do |genre, index|
      puts "#{index}: #{genre.name.capitalize}"
    end
  end

  def get
    choice = super
    if choice == 1
      display
      index = verify_index(@list, message: "Select a Genre by it's index: ")
      @list[index]
    else
      id = verify_int(message: 'Specify the Genre Id: ')
      name = verify_str(message: 'Specify a Genre name: ')
      genre = Genre.new(id, name)
      @list << genre
      genre
    end
  end

  private

  def generate_defaults
    thriller = Genre.new(1, 'thriller')
    suspense = Genre.new(2, 'suspense')
    science_fiction = Genre.new(3, 'science fiction')
    list = load_json(File.join(File.dirname(__FILE__), '../json/genres.json'))
    @list = if list.empty?
              [thriller, suspense, science_fiction]
            else
              list
            end
  end
end
