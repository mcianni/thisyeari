FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password 'password'
    password_confirmation { password }
    name 'John'
    provider 'Twitter'
    uid '12345'
  end

end
