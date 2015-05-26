FactoryGirl.define do
  factory :user do
    sequence(:email){ |i| "mail_#{i}@email.ru" }
    password 'password'
    password_confirmation 'password'

    factory :sample_user do
      email 'nik@email.ru'
      password '123456789'
      password_confirmation '123456789'
    end

    factory :no_email_user do
      email 'nik'
      password '123456789'
      password_confirmation '123456789'
    end

    factory :empty_email do
      email ''
      password '123456789'
      password_confirmation '123456789'
    end

    factory :empty_password do
      email 'nik'
      password ''
      password_confirmation ''
    end
  end
end
