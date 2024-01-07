require 'rails_helper'

RSpec.describe Article, type: :model do
  it "is valid with valid attributes" do
    expect(Article.new).to_not be_valid
  end

  it "is not valid without a title" do
    article = Article.new(title: nil)
    expect(article).to_not be_valid
  end

  it "is not valid without content" do
    article = Article.new(content: nil)
    expect(article).to_not be_valid
  end

  it "is not valid without a title and content" do
    article = Article.new(title: nil, content: nil)
    expect(article).to_not be_valid
  end
end