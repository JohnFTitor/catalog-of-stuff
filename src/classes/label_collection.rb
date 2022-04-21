require_relative './label'
require_relative './type_collection'
require_relative '../modules/json_handler'
class LabelCollection < TypeCollection
  include JsonHandler
  attr_reader :list

  def initialize
    super
    @list = create_defaults
  end

  def get
    choice = super
    if choice == 1
      display
      index = verify_index(@list)
      @list[index]
    else
      create_label
    end
  end

  def display
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
    new_label = Label.new(2, 'New', 'Blue')
    labels = load_json(File.join(File.dirname(__FILE__), '../json/labels.json'))
    if labels.empty?
      @list.push(gift, new_label)
    else
      @list = labels
    end
  end
end
