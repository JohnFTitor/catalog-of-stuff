require_relative '../modules/common_checks'
class TypeCollection
  attr_reader :list

  include CommonChecks

  def initialize
    @list = []
  end

  def get
    type = @list[0].class.name
    message = "Select [1] for a #{type} from the list or Select [2] to create a new #{type}: "
    verify_range(1, 2, message: message, error: 'Please enter valid choice: ')
  end

  def display
    puts @list
  end
end
