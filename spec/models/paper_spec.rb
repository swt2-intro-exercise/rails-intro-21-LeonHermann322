require 'rails_helper'

RSpec.describe Paper, type: :model do
  it 'should not validate without all attributes set' do
    @paper = Paper.new(title: "a", venue: "b")
    expect(@paper).to_not be_valid
    @paper = Paper.new(title: "a", year: 1)
    expect(@paper).to_not be_valid
    @paper = Paper.new(venue: "a", venue: "b")
    expect(@paper).to_not be_valid
  end

  it 'attribute year should be integer' do
    @paper = Paper.new(title: "a", venue: "b", year: "c")
    expect(@paper).to_not be_valid
    @paper = Paper.new(title: "a", venue: "b", year: 1)
    expect(@paper).to be_valid
  end
end
