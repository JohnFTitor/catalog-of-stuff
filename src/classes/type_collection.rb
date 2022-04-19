class TypeCollection
  def initialize
    @items = []
  end

  def get
    puts "[1] Select a #{self.class.name} from the list or [2] create a new #{self.class.name}"
  end

  def list
    puts @items
  end
end
