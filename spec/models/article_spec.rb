require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'positive number' do
    expect(1).to be_positive
    expect(3).to be > 2
  end

  it 'test article object' do
    # article = Article.create({ title: 'sample article', content: 'sample content', slug: 'sample-article' })
    # article = FactoryBot.create(:article)
    article = create(:article)
    expect(article.title).to eq('sample article')
  end
end
