FactoryBot.define do
  factory :comment do
    content { "MyString" }

    association :user
    association :item
  end
end
