FactoryGirl.define do
  factory :user do
    sequence(:email){ |i| "mail_#{i}@email.ru" }
    password 'password'

    factory :sample_user do
      email 'nik@email.ru'
      password '123456789'
    end
  end
end
