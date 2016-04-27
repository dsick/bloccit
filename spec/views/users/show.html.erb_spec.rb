require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do

  let(:my_user) { create(:user, email: "sick@davesick.net") }
  let(:my_topic) { create(:topic) }
  let(:my_post) { create(:post, title: "My awesome title", topic: my_topic, user: my_user) }
  let!(:my_comment) { create(:comment, post: my_post, user: my_user) }

  describe "users/show" do
    it "renders" do
      assign :user, my_user
      assign :favorites, []
      render template: 'users/show'
      expect(rendered).to include("My awesome title")
    end
  end
end
