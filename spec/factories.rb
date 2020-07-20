FactoryBot.define do
  factory :trail, class: Trail do
    sequence(:name) { |n| "Trail #{n}" }
    sequence(:address) { |n| "#{n*100} Street" }
    sequence(:length) { 100 }
  end
end
