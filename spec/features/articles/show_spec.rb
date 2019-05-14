require "rails_helper"

RSpec.describe "Article's Show Spec,", type: :feature do

  before :each do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  describe "user sees one article at /articles/:id," do
    it "it displays information for one article" do

      visit article_path(@article_1)

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
      expect(page).to_not have_content(@article_2.title)
      expect(page).to_not have_content(@article_2.body)
    end
  end
end
