FactoryBot.define do
  factory :article do
    sequence(:title) { |number| "sample article #{number}" }
    content { "sample content" }
    sequence(:slug) { |number| "sample-article-#{number}" }
  end
end
