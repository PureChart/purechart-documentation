Rails.application.routes.draw do
  root :to => redirect('/articles')
  get 'articles', to: 'articles#index'

  # Embedded article GET route
  get '/embedded/:title', to: 'articles#open_article', as: 'article'
end
