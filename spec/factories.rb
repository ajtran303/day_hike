FactoryBot.define do
  factory :trail, class: Trail do
    sequence(:name) { |n| "Trail #{n}" }
    address { "It's Over There!" }
    length { 100 }
  end

  factory :trip, class: Trip do
    sequence(:name) { |n| "Trip #{n}" }
  end
end
