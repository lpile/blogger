require "rails_helper"

RSpec.describe "Article's Index Spec,", type: :feature do

  before :each do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  describe "user sees all articles at /articles," do
    it "it displays all articles" do

      visit articles_path

      expect(page).to have_link(@article_1.title, href: article_path(@article_1))
      expect(page).to have_link(@article_2.title, href: article_path(@article_2))
    end

    it "there's a link to create new article" do

      visit articles_path

      expect(page).to have_link("Create a New Article", href: new_article_path)

      click_link "Create a New Article"

      expect(current_path).to eq(new_article_path)
    end
  end
end
