Rails.application.routes.draw do

  defaults format: :json do
    root 'chart#index'
    get 'search',  to: 'chart#show'
  end
  
end
