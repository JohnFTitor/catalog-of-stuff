require_relative '../classes/genre'

describe Genre do 
  before :all do
    @genre = Genre.new(id, name)
  end
  
  context '#new' do 
    it 'should be an instance of Genre' do 
      expect(@genre).to be_an_instance_of(Genre)
    end
  end
end
