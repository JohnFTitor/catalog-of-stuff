require_relative '../classes/genre'

describe Genre do 
  before :all do
    @genre = Genre.new(1, 'Thriller')
  end
  
  context '#new' do 
    it 'should be an instance of Genre' do 
      expect(@genre).to be_an_instance_of(Genre)
    end
  end

  context 'Should have property name' do 
    it 'should be able to read name' do 
      name = @genre.name
      expect(name).to eql 'Thriller'
    end

    it 'should not be able to write name' do 
      expect {@genre.name = 'Something'}.to raise_error(NoMethodError)
    end
  end

  context 'Should add item' do 
    it 'should add item to genre items array' do 
      item = double('Item', :genre= => nil)

      items = @genre.add_item(item)

      expect(items.length).to be 1
    end

    it 'should add multiple items to genre items array' do 
      item1 = double('Item', :genre= => nil)
      item2 = double('Item', :genre= => nil)
      item3 = double('Item', :genre= => nil)

      @genre.add_item(item1)      
      @genre.add_item(item2)      
      items = @genre.add_item(item3)      

      expect(items.length).to be 4
    end

    it 'item should have genre property equal to self' do 
      item = spy('Item')

      items = @genre.add_item(item)
      
      expect(item).to have_received(:genre=).with(@genre)
    end
  end
end
