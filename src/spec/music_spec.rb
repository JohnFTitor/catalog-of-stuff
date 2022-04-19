describe MusicAlbum do 
  before :all do 
    @music = MusicAlbum.new(false, 1, Date.new(2001, 2, 3))
  end
  
  contest '#new' do 
    it 'should be an instance of MusicAlbum' do
      expect(@music).to be_an_instance_of(MusicAlbum)
    end
  end
end
