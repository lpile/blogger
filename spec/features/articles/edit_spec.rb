require "rails_helper"

RSpec.describe "Article's Edit Spec,", type: :feature do

  before :each do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  describe "user edits a existing article" do
    it "they fill in new attributes" do

      visit edit_article_path(@article_1)

      fill_in "Title", with: "Edit Title!"
      fill_in "Body",  with: "Edit Body!"
      click_on "Submit"

      expect(current_path).to eq(article_path(@article_1))
      expect(page).to have_content("Edit Title!")
      expect(page).to have_content("Edit Body!")
      expect(page).to_not have_content("Title 1")
      expect(page).to_not have_content("Body 1")
      expect(page).to have_content("Article Edit Title! Updated!")
    end
  end
end
