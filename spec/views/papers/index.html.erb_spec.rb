require 'rails_helper'

RSpec.describe "papers/index", type: :view do
  before(:each) do
    assign(:papers, [
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ),
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      )
    ])
  end

  it "renders a list of papers" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Venue".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end

  it "can filter by year" do
    paper1950 = Paper.new(title: "a", venue: "b", year: 1950)
    paper1968 = Paper.new(title: "c", venue: "d", year: 1968)
    paper1950.save
    paper1968.save

    filtered = Paper.published_in(1950)

    expect(filtered.include?(paper1950)).to be true
    expect(filtered.include?(paper1968)).to be false
  end
end
