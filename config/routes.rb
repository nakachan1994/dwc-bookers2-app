Rails.application.routes.draw do
  root to:'homes#top'
  get 'home/about' => 'homes#about',as: 'homes_about'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  resources :books, only:[:new, :create, :index, :show, :edit,:destroy, :update] do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  resources :users, only:[:index, :show, :edit, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  post 'followings/:id' => 'relationships#followings', as: 'followings'
  post 'followers/:id' => 'relationships#followers', as: 'followers'
  get 'search' => 'searches#search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
