require_relative '../genre'
require_relative './genre_helper'

describe Genre do
  before(:all) do
    @genre = Genre.new('Hip-Hop')
    @item = Item.new('2010-10-10')
  end

  describe '#new' do
    it 'Creates a new Genre instance' do
      expect(@genre).to be_instance_of(Genre)
    end
  end

  describe '#add_item' do
    it 'exists' do
      expect(@genre).to respond_to(:add_item)
    end

    it 'adds Item class instance to its item array' do
      @genre.add_item(@item)

      expect(@genre.items).to include(@item)
    end
  end
end
