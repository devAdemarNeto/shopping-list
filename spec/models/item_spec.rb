# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:valid_attributes) {
    { name: 'Arroz', quantity: '1kg' }
  }

  it "é válido com atributos corretos" do
    item = Item.new(valid_attributes)
    expect(item).to be_valid
  end

  it "requer um nome" do
    item = Item.new(valid_attributes.merge(name: nil))
    expect(item).not_to be_valid
    expect(item.errors[:name]).to include("can't be blank")
  end

  it "requer nome com pelo menos 2 caracteres" do
    item = Item.new(valid_attributes.merge(name: 'A'))
    expect(item).not_to be_valid
    expect(item.errors[:name]).to include("is too short (minimum is 2 characters)")
  end

  it "usa quantidade padrão quando não especificada" do
    item = Item.new(name: 'Feijão')
    expect(item.quantity).to eq('1 un')
  end

  it "usa purchased=false como padrão" do
    item = Item.new(valid_attributes)
    expect(item.purchased).to be_falsey
  end
end