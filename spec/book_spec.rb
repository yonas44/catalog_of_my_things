require_relative '../book'

RSpec.describe Book do
    before :all do
        @book1 = described_class.new('Mr.x', 'good', '2010-02-01')
        @book2 = described_class.new('Mr.y', 'good', '2015-02-01')
    end

    it "#add_label" do
        label = double(:title => 'label1', :items => [])
        @book1.add_label(label)
        expect(@book1.label.title).to eq 'label1' 
        expect(label.items.length).to eq 1 
    end

    it "#add_genre" do
        genre = double(:name => 'genre1', :items => [])
        @book1.add_genre(genre)
        expect(@book1.genre.name).to eq 'genre1' 
        expect(genre.items.length).to eq 1 
    end

    it "#can_be_archived?" do
        expect(@book1.can_be_archived?).to be true
        expect(@book2.can_be_archived?).to be false
    end
end