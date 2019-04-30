require 'rails_helper'

describe "user edits an article" do
  describe "they link from the show page" do
    describe "they fill in an edit field and submit" do
      it "displays the updated information on the show page" do
      article = Article.create!(title: "New Title!", body: "New Body!")

      visit article_path(article)
      click_link "Edit"

      fill_in "article[title]", with: "Different Title!"
      fill_in "article[body]", with: "Different Body!"
      click_on "Update Article"

      expect(page).to have_content("Different Title!")
      expect(page).to have_content("Different Body!")
      expect(page).to have_content("Article 'Different Title!' was updated.")
      end
    end
  end
end
