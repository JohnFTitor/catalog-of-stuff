require 'date'

class Item
  attr_reader :published_date

  def initialize(id, published_date, archived)
    @id = id
    @published_date = published_date
    @archived = archived
  end

  def move_to_archive
    @archived = can_be_archived?
    @archived
  end

  private

  def can_be_archived?
    Date.today.year - @published_date.year >= 10
  end
end
