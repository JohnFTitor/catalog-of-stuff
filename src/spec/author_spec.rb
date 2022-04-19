require_relative '../classes/author'
describe Author do
  before(:each) do
    @author = Author.new
  end
  context '#new' do
    it 'author is an instance of class Author' do
      expect(@author).to be_instance_of(Author)
    end
  end
end
