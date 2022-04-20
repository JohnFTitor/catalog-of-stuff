require_relative '../classes/author'
describe Author do
  before(:each) do
    @author = Author.new(1, 'john', 'smith')
  end
  context '#new' do
    it 'author is an instance of class Author and takes 3 parameters' do
      expect(@author).to be_instance_of(Author)
    end

    it 'gives Argument error when more or less than 3 params is given' do
      expect { Author.new(1, 'john') }.to raise_error(ArgumentError)
    end
  end

  context '#id' do
    it 'id is private' do
      expect { @author.id }.to raise_error(NoMethodError)
    end
  end

  context '#first_name' do
    it 'can be read' do
      expect(@author.first_name).to eql('john')
    end

    it "can't be written" do
      expect { @author.first_name = 'author1' }.to raise_error(NoMethodError)
    end
  end

  context '#last_name' do
    it 'can be read' do
      expect(@author.last_name).to eql('smith')
    end

    it "can't be written" do
      expect { @author.last_name = 'author2' }.to raise_error(NoMethodError)
    end
  end

  context '#items' do
    it 'items is private' do
      expect { @author.items }.to raise_error(NoMethodError)
    end
  end

  context '#add_item' do
    it 'take item object as an input and sets the author of the item' do
      mocked_item = double('item')
      allow(mocked_item).to receive(:author=) { [] }
      expect(@author.add_item(mocked_item)).to equal(@author)
    end
    it 'gives error if more or less than 1 parameter as input' do
      expect { @author.add_item }.to raise_error(ArgumentError)
    end
  end
end
