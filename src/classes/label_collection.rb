require_relative './label'
require_relative './type_collection'

class LabelCollection < TypeCollection
  def initialize
    super
    create_defaults if @list.length.zero?
  end

  def get
    choice = super
    if choice == 1
      list
      index = verify_index(@list)
      @list[index]
    else
      create_label
    end
  end

  def list
    puts
    @list.each_with_index { |label, index| puts "#{index}) Title: #{label.title},  Color: #{label.color}" }
  end

  private

  def create_label
    id = verify_int(message: 'Label ID: ', error: 'Please input correct numeric id: ')
    title = verify_str(message: 'Label Title: ', error: 'Please input a string for Title: ')
    color = verify_str(message: 'Label Color: ', error: 'Please input a string for Color: ')
    label = Label.new(id, title, color)
    @list << label
    label
  end

  def create_defaults
    gift = Label.new(1, 'Gift', 'Yellow')
    new = Label.new(2, 'New', 'Blue')
    @list.push(gift, new)
  end
end
