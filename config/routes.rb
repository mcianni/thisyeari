ThisYearI::Application.routes.draw do

  root 'pages#home'
  get 'privacy-policy' => 'pages#privacy_policy', as: 'privacy_policy'
  get 'about' => 'pages#about'
  get 'demo' => 'pages#demo'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resource :goals, path: 'my-goal' do
    resources :points, only: [:new, :create]
  end

end
