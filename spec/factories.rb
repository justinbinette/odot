FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name "Last"
    sequence(:email) { |n| "user#{n}@odot.com"}
    password "P455w0rd!"
    password_confirmation "P455w0rd!"
  end

  factory :todo_list do
    title "Todo List Title"
    description "Todo List Description"
    user
  end
end
