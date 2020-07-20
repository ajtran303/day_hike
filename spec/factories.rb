FactoryBot.define do
  factory :trail, class: Trail do
    name { "A Trail" }
    address { "Over There!" }
    length { 100 }
  end

  factory :trip, class: Trip do
    sequence(:name) { |n| "Trip #{n}" }
  end
end
