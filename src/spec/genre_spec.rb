require_relative '../classes/genre'

describe Genre do
  before :each do
    @genre = Genre.new(1, 'Thriller')
  end

  context '#new' do
    it 'should be an instance of Genre' do
      expect(@genre).to be_an_instance_of(Genre)
    end
  end

  context 'Property name' do
    it 'should be able to be read' do
      name = @genre.name
      expect(name).to eql 'Thriller'
    end

    it 'should not be able to be written' do
      expect { @genre.name = 'Something' }.to raise_error(NoMethodError)
    end
  end

  context 'Property id' do
    it 'should not be accesible' do
      expect { @genre.id }.to raise_error(NoMethodError)
      expect { @genre.id = 1 }.to raise_error(NoMethodError)
    end
  end

  context 'Property items' do
    it 'should not be accesible' do
      expect { @genre.items }.to raise_error(NoMethodError)
      expect { @genre.items = [] }.to raise_error(NoMethodError)
    end
  end

  context 'Add item' do
    it 'item should have genre property equal to self' do
      item = spy('Item')

      @genre.add_item(item)

      expect(item).to have_received(:genre=).with(@genre)
    end
  end
end
