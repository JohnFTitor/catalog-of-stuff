require_relative '../classes/book'

describe Book do
  before(:each) do
    @book = Book.new('publisher', 'good')
  end

  context '#new' do
    it 'is an instance of Book and takes two parameter' do
      expect(@book).to be_instance_of(Book)
    end

    it 'gives Argument error when more or less than 3 params given' do
      expect { Book.new('publisher') }.to raise_error(ArgumentError)
    end

    it 'is a child of Item' do
      expect(@book).to be_kind_of(Item)
    end
  end

end
