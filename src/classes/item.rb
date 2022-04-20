require 'date'
require_relative '../modules/json_methods'

class Item
  include JsonMethods
  attr_reader :published_date, :genre, :label, :author

  def initialize(id, published_date)
    @id = id
    @published_date = published_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
    @archived
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def label=(label)
    @label = label
    label.add_item(self)
  end

  def author=(author)
    @author = author
    author.add_item(self)
  end

  private

  def can_be_archived?
    Date.today.year - @published_date.year >= 10
  end
end
