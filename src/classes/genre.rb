class Genre
  attr_reader :name

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self unless item.genre == self
    @items << item unless @items.include?(item)
    @items
  end
end
