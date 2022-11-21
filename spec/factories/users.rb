FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { "123456" }


    factory :teacher do
      after(:create) { |user| user.add_role!(:admin) }
    end

    factory :student do
      after(:create) { |user| user.add_role!(:superadmin) }
    end
  end
end
