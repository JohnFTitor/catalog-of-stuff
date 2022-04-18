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
    it 'return true if published_date is older than 10 years' do
      expect(@item.can_be_archived?).to be true
    end

    it 'return false if published_date is smaller than 10 years' do
      item1 = Item.new(4, Date.new(2015, 2, 3), true)
      expect(item1.can_be_archived?).to be false
    end
  end
end
