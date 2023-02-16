require_relative '../game'

describe Game do
  before(:all) do
    @game = Game.new('Multiplayer', '2021-01-01', '2020-01-01', 'Mert', 'Kaya')
  end

  describe '#new' do
    it 'Creates a new Game instance from the parent class' do
      expect(@game).to be_instance_of(Game)
    end

    describe '#can_be_archived?' do
      it 'exists' do
        expect(@game).to respond_to(:can_be_archived?)
      end

      it 'returns false' do
        expect(@game.can_be_archived?).to be_falsey
      end
    end
  end
end
