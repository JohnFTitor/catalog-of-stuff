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

end
