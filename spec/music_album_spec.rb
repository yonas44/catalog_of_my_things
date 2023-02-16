require_relative '../music_album'

describe MusicAlbum do
  before(:all) do
    @music = MusicAlbum.new('New world', 'Val', 'Hip-Hop', '2015-04-05', true)
  end

  describe '#new' do
    it 'Creates a new MusicAlbum instance' do
      expect(@music).to be_instance_of(MusicAlbum)
    end

    describe '#can_be_archived?' do
      it 'exists' do
        expect(@music).to respond_to(:can_be_archived?)
      end

      it 'returns false' do
        expect(@music.can_be_archived?).to be_falsey
      end
    end
  end
end
