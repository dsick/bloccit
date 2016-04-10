require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "New Question Title", body: "New Question Body") }

  describe "attributes" do
    # #2
    it "responds to title" do
      expect(question).to respond_to(:title)
    end
    # #3
    it "responds to body" do
      expect(question).to respond_to(:body)
    end
  end
end
