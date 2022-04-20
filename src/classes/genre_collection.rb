require_relative './type_collection.rb'
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

  private

  def generate_defaults 
    thriller = Genre.new(1, 'thriller')
    suspense = Genre.new(2, 'suspense')
    science_fiction = Genre.new(3, 'science fiction')
    @list = [thriller, suspense, science_fiction]
  end

end
