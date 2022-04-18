require 'date'

class Item
  attr_reader :published_date, :genre, :label, :author

  def initialize(id, published_date, archived)
    @id = id
    @published_date = published_date
    @archived = archived
  end

  def move_to_archive
    @archived = can_be_archived?
    @archived
  end

  def genre= (genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

   def label= (label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

   def author= (author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  private

  def can_be_archived?
    Date.today.year - @published_date.year >= 10
  end
end
