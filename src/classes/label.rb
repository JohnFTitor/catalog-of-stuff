class Label
  attr_reader :title, :color

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end


end
