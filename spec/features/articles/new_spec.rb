require "rails_helper"

RSpec.describe "Article's New Spec,", type: :feature do

  before :each do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  describe "user creates a new article" do
    it "they fill in attributes" do

      visit new_article_path

      fill_in "Title", with: "New Title!"
      fill_in "Body",  with: "New Body!"
      click_on "Submit"

      new_article = Article.last

      expect(current_path).to eq(article_path(new_article))
      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")
    end
  end
end
