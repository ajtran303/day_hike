Rails.application.routes.draw do
  get "/trips", to: "trips#index"
  get "/trips/:id", to: "trips#show"
end
