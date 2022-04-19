require_relative '../classes/music'

describe MusicAlbum do 
  before :all do 
    @music = MusicAlbum.new(false, 1, Date.new(2001, 2, 3))
  end
  
  context '#new' do 
    it 'should be an instance of MusicAlbum' do
      expect(@music).to be_an_instance_of(MusicAlbum)
    end

    it 'should be a kind of Item' do 
      expect(@music).to be_a_kind_of(Item)
    end
  end

  context 'Should have instance of spotify' do 
    it 'instance can be read' do 
      expect {@music.spotify}.to_not raise_error(MethodError)
    end

    it 'instance cannot be written' do 
      expect {@music.spotify = true}.to raise_error(MethodError)
    end
  end
end
