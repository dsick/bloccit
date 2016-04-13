require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:price) { rand(100..200) }
  # #3
  let(:topic) { Topic.create!(name: name, description: description) }
  # #4
  let(:sponsored_post) { topic.sponsored_posts.create!(title: title, price: price) }

  it { is_expected.to belong_to(:topic) }


  describe "attributes" do
    # #2
    it "has a title and price attribute" do
     expect(sponsored_post).to have_attributes(title: title, price: price)
    end
  end
end
