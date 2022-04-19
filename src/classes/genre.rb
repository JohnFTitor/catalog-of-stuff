class Genre 
  attr_reader :name

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end
end
