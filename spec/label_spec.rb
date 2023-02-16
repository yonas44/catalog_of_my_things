require_relative '../label'
require_relative 'label_mock'

RSpec.describe Label do
  before :all do
    @label1 = described_class.new('label-1', 'red')
  end

  it '#add_item' do
    item = Item.new('2021-01-01')
    @label1.add_item(item)
    expect(@label1.items.length).to eq 1
    expect(item.label.title).to eq 'label-1'
  end
end
