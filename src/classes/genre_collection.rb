require_relative './type_collection'
require_relative './genre'

class GenreCollection < TypeCollection
  def initialize
    @list = generate_defaults
  end

  def list
    @list.each_with_index do |genre, index|
      puts "#{index}: #{genre.name.capitalize}"
    end
  end

  def get
    choice = super
    if choice === 1
      list
      index = verify_index(@list, message: "Select a Genre by it's index: ")
      @list[index]
    else
      id = verify_int(message: 'Specify the Genre Id: ')
      name = verify_str(message: 'Specify a Genre name: ')
      Genre.new(id, name)
    end
  end

  private

  def generate_defaults
    thriller = Genre.new(1, 'thriller')
    suspense = Genre.new(2, 'suspense')
    science_fiction = Genre.new(3, 'science fiction')
    @list = [thriller, suspense, science_fiction]
  end
end
