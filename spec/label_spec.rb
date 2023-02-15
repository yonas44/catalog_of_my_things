require_relative '../label'

RSpec.describe Label do
    before :all do
        class Item
            attr_accessor :label
            def initialize(published_date)
                @published_date = published_date
            end
        end
        @label1 = described_class.new('label-1', 'red')
    end

    it "#add_item" do
        item = Item.new('2021-01-01')
        @label1.add_item(item)
        expect(@label1.items.length).to eq 1 
        expect(item.label.title).to eq 'label-1' 
    end
end