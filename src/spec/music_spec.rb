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
      value = @music.on_spotify
      expect(value).to be false
    end

    it 'instance cannot be written' do
      expect { @music.on_spotify = true }.to raise_error(NoMethodError)
    end
  end

  context 'Should move to archive' do
    it "should be false if on_spotify is false. No matter if it's older" do
      move = @music.move_to_archive
      expect(move).to be false
    end

    it "should be true if on_spotify is true and it's older than 10 years" do
      music = MusicAlbum.new(true, 1, Date.new(2001, 3, 5))

      move = music.move_to_archive

      expect(move).to be true
    end

    it "should be false if on_spotify is true and it's not older than 10 years" do
      music = MusicAlbum.new(true, 1, Date.new(2015, 3, 5))

      move = music.move_to_archive

      expect(move).to be false
    end
  end

  context '#can_be_archived?' do
    it 'should be private' do
      expect { @music.can_be_archived? }.to raise_error(NoMethodError)
    end
  end
end
