class Item
  attr_reader :published_date
  def initialize(id, published_date, archived)
    @id = id
    @published_date = published_date
    @archived = archived
  end
end