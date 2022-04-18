require_relative '../classes/item'

describe Item do
  before(:each) do
    @item = Item.new(1, '2021/11/12', true)
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
      expect(@item.published_date).to eql('2021/11/12')
    end

    it 'can not be written' do
      expect { @item.published_date = 3 }.to raise_error(NoMethodError)
    end
  end

  context '#archived' do
    it 'is private' do
      expect { @item.archived }.to raise_error(NoMethodError)
    end
  end
end
