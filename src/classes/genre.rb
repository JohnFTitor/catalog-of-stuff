require_relative '../modules/json_methods.rb'
class Genre
  attr_reader :name

  include JsonMethods

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
    @args = [id, name]
  end

  def add_item(item)
    item.genre = self unless item.genre == self
    @items << item unless @items.include?(item)
  end

   def self.json_create(object)
    new(*object['arguments'])
  end
end
