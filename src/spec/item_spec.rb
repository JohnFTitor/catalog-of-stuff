require_relative '../classes/item'

describe Item do
  before(:each) do
    @item = Item.new(1, Date.new(2001, 2, 3), true)
  end

  context '#new' do
    it 'is an instance of Item and takes three parameter' do
      expect(@item).to be_instance_of(Item)
    end

    it 'gives Argument error when more or less than 3 params given' do
      expect { Item.new(1, '2021') }.to raise_error(ArgumentError)
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
      item = Item.new(4, Date.new(2015, 2, 3), true)
      expect(item.move_to_archive).to be false
    end
  end
end
