require_relative '../modules/json_methods'

class Author
  attr_reader :first_name, :last_name

  include JsonMethods

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
    @args = [id, first_name, last_name]
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self unless item.author == self
  end

  def self.json_create(object)
    new(*object['arguments'])
  end
end
