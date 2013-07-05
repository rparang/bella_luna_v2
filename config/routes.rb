BellaLunaV2::Application.routes.draw do
  resources :categories

  scope "api" do
    resources :menus do
    	collection { post :sort }
    end
  end

  root :to => "main#index"
  match '*path', :to => 'main#index'
end
