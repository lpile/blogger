require "rails_helper"

RSpec.describe "Article's Show Spec,", type: :feature do

  before :each do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
    @comment_1 = @article_1.comments.create!(author_name: "Me", body: "Commenty comments")
    @comment_2 = @article_1.comments.create!(author_name: "You", body: "So much to say")
    @comment_3 = @article_2.comments.create!(author_name: "We", body: "We tee lee")
  end

  describe "user sees one article at /articles/:id," do
    it "it displays information for one article" do

      visit article_path(@article_1)

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
      expect(page).to_not have_content(@article_2.title)
      expect(page).to_not have_content(@article_2.body)
    end

    it "it displays comments for one article" do

      visit article_path(@article_1)

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
      expect(page).to have_content(@comment_1.author_name)
      expect(page).to have_content(@comment_2.author_name)
      expect(page).to_not have_content(@comment_3.author_name)
    end

    it "there's a link to go back to index page" do

      visit article_path(@article_1)

      expect(page).to have_link("Back to Articles List", href: articles_path)

      click_link "Back to Articles List"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_2.title)
    end

    it "there's a link to edit the article" do

      visit article_path(@article_1)

      expect(page).to have_link("Edit", href: edit_article_path(@article_1))

      click_link "Edit"

      expect(current_path).to eq(edit_article_path(@article_1))
    end
  end

  describe "there's a link to delete an article" do
    it "it displays all articles without the deleted entry" do

      visit article_path(@article_1)

      expect(page).to have_link("Delete", href: article_path(@article_1))

      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(@article_2.title)
      expect(page).to_not have_content(@article_1.title)
    end
  end
end
