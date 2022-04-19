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
end
