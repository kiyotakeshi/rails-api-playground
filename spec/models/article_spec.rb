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
    expect(article.title).to eq('sample article 1')
  end

  describe '#validations' do
    let(:article) { build(:article) }
    it 'test factory is valid' do
      expect(article).to be_valid # article.valid? == true
      article.save!
      another_article = build(:article)
      expect(another_article).to be_valid
    end

    it 'has an invalid title' do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'has an invalid content' do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'has an invalid slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it 'validates unique slug' do
      article1 = create(:article)
      expect(article1).to be_valid
      article2 = build(:article, slug: article1.slug)
      expect(article2).not_to be_valid
      expect(article2.errors[:slug]).to include('has already been taken')
    end
  end

  describe '.recent' do
    it 'returns articles in the correct order' do
      older_article = create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)

      expect(described_class.recent).to eq([recent_article, older_article])

      recent_article.update_column(:created_at, 2.hours.ago)

      expect(described_class.recent).to eq([older_article, recent_article])
    end
  end
end
