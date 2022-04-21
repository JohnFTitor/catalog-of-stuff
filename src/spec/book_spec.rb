require_relative '../classes/book'

describe Book do
  before(:each) do
    @book = Book.new('publisher', 'good', 1, Date.new(2001, 2, 3))
  end

  context '#new' do
    it 'is an instance of Book and takes 4 parameter' do
      expect(@book).to be_instance_of(Book)
    end

    it 'gives Argument error when more or less than 4 params given' do
      expect { Book.new('publisher') }.to raise_error(ArgumentError)
    end

    it 'is a child of Item' do
      expect(@book).to be_kind_of(Item)
    end
  end

  context '#publisher' do
    it 'can be read' do
      expect(@book.publisher).to eql('publisher')
    end

    it 'can not be written' do
      expect { @book.publisher = 3 }.to raise_error(NoMethodError)
    end
  end

  context '#cover_state' do
    it 'can be read' do
      expect(@book.cover_state).to eql('good')
    end

    it 'can not be written' do
      expect { @book.cover_state = 3 }.to raise_error(NoMethodError)
    end
  end

  context '#move_to_archive' do
    it "should return true if cover_state equals 'bad', even if parent's method returns false" do
      bad_book = Book.new('publisher', 'bad', 1, Date.new(2015, 2, 3))
      expect(bad_book.move_to_archive).to be true
    end

    it "should return true if the parent's method returns true" do
      expect(@book.move_to_archive).to be true
    end

    it 'should return false otherwise' do
      good_book = Book.new('publisher', 'good', 1, Date.new(2015, 2, 3))
      expect(good_book.move_to_archive).to be false
    end
  end
end
