require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}

  it 'exists' do
    expect(food_truck).to be_a(FoodTruck)
  end

  it 'has a name' do
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end
  
  it 'starts without inventory' do
    expect(food_truck.inventory).to eq({})
  end
  
  it 'can check stock of items' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    expect(food_truck.check_stock(item1)).to eq(0)
  end
  
  it 'can stock items' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    
    food_truck.stock(item1, 30)
    expect(food_truck.inventory).to eq({item1 => 30})
    food_truck.check_stock(item1)

    food_truck.stock(item1, 25)
    expect(food_truck.inventory).to eq({item1 => 55})
    food_truck.check_stock(item1)

    food_truck.stock(item2, 12)
    expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
    food_truck.check_stock(item2)
  end
end