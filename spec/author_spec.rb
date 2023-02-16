require_relative '../author'

class Item
  attr_accessor :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = archived
  end
end

describe Author do
  before(:all) do
    @author = Author.new('Mert', 'Kaya')
    @item = Item.new('2013-7-15')
  end

  describe '#new' do
    it 'Creates a new Author instance' do
      expect(@author).to be_instance_of(Author)
    end
  end

  describe '#add_item' do
    it 'exists' do
      expect(@author).to respond_to(:add_item)
    end

    it 'adds Item class instance to corresponding item array' do
      @author.add_item(@item)

      expect(@author.items).to include(@item)
    end
  end
end
