require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        title: "Title",
        content: "My very long Text"
      ),
      Article.create!(
        title: "Title",
        content: "My very long Text"
      )
    ])
  end

end
