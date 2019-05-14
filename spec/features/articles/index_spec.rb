require "rails_helper"

RSpec.describe "Article's Index Spec,", type: :feature do

  before :each do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  describe "user sees all articles at /articles" do
    it "it displays all articles" do

      visit '/articles'

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_2.title)
    end
  end
end
