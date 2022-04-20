require_relative '../classes/label'

describe Label do
  before(:each) do
    @label = Label.new(2, 'best seller', 'blue')
  end

  context '#new' do
    it 'is an instance of Label and takes 3 parameter' do
      expect(@label).to be_instance_of(Label)
    end

    it 'gives Argument error when more or less than 3 params given' do
      expect { Label.new('publisher') }.to raise_error(ArgumentError)
    end
  end

  context '#id' do
    it 'is private' do
      expect { @label.id }.to raise_error(NoMethodError)
    end
  end

  context '#items' do
    it 'is private' do
      expect { @label.items }.to raise_error(NoMethodError)
    end
  end

  context '#title' do
    it 'can be read' do
      expect(@label.title).to eql('best seller')
    end

    it 'can not be written' do
      expect { @label.title = 'new' }.to raise_error(NoMethodError)
    end
  end

  context '#color' do
    it 'can be read' do
      expect(@label.color).to eql('blue')
    end

    it 'can not be written' do
      expect { @label.cover_state = 'red' }.to raise_error(NoMethodError)
    end
  end

  context '#add_item' do
    it 'takes item object as parameter and sets the label of the item' do
      mocked_item = spy('item')
      allow(mocked_item).to receive(:label=) { [] }
      expect(@label.add_item(mocked_item)).to equal(@label)
    end
    it 'giver error if more or less than 1 parameter as input' do
      expect { @label.add_item }.to raise_error(ArgumentError)
    end
  end
end
