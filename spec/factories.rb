FactoryBot.define do
  factory :group do
    name { "MyString" }
    icon { "MyString" }
  end

  factory :transaction do
    author_id { 1 }
    name { "MyString" }
    amount { "9.99" }
  end

  factory :user do
    username { 'flpfar' }
  end
end
