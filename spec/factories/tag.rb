FactoryGirl.define do
  factory :tag do
    sequence(:title){ |i| "tag_#{i}" }
  end
end
