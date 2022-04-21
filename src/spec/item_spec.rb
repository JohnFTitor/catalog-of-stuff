require_relative '../classes/item'

describe Item do
  before(:each) do
    @item = Item.new(1, Date.new(2001, 2, 3))
  end

  context '#new' do
    it 'is an instance of Item and takes two parameter' do
      expect(@item).to be_instance_of(Item)
    end

    it 'gives Argument error when more or less than 2 params given' do
      expect { Item.new(1) }.to raise_error(ArgumentError)
    end
  end

  context '#id' do
    it 'is private' do
      expect { @item.id }.to raise_error(NoMethodError)
    end
  end

  context '#published_date' do
    it 'can be read' do
      date = Date.new(2001, 2, 3)
      expect(@item.published_date).to eql(date)
    end

    it 'can not be written' do
      expect { @item.published_date = 3 }.to raise_error(NoMethodError)
    end

    it 'is an instance of Date' do
      expect(@item.published_date).to be_instance_of(Date)
    end
  end

  context '#archived' do
    it 'is private' do
      expect { @item.archived }.to raise_error(NoMethodError)
    end
  end

  context '#can_be_archived?' do
    it 'should be private' do
      expect { @item.can_be_archived? }.to raise_error(NoMethodError)
    end
  end

  context '#move_to_archive' do
    it 'change archive property to true' do
      expect(@item.move_to_archive).to be true
    end

    it 'change archive property to false' do
      item = Item.new(4, Date.new(2015, 2, 3))
      expect(item.move_to_archive).to be false
    end
  end

  context '#genre' do
    it "should read genre instance variable even if it's empty" do
      expect(@item.genre).to be_nil
    end

    it 'sets its genre using a setter method' do
      mocked_genre = double('Genre')
      allow(mocked_genre).to receive(:add_item) { [] }
      @item.genre = (mocked_genre)
      expect(@item.genre).to eql(mocked_genre)
    end
  end

  context '#label' do
    it "should read label instance variable even if it's empty" do
      expect(@item.label).to be_nil
    end

    it 'sets its label using a setter method' do
      mocked_label = double('Label')
      allow(mocked_label).to receive(:add_item) { [] }
      @item.label = (mocked_label)
      expect(@item.label).to eql(mocked_label)
    end
  end

  context '#author' do
    it "should read author instance variable even if it's empty" do
      expect(@item.author).to be_nil
    end

    it 'sets its author using a setter method' do
      mocked_author = double('Author')
      allow(mocked_author).to receive(:add_item) { [] }
      @item.author = (mocked_author)
      expect(@item.author).to eql(mocked_author)
    end
  end
end
