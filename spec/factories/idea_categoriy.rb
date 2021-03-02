FactoryBot.define do
  factory :idea_category do
    name { Faker::Name.last_name }
    body { 'アイデア本文' }
  end
end
