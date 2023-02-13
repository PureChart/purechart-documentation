Rails.application.routes.draw do
  root :to => redirect('/articles/getting-started')
  get 'articles/:title', to: 'articles#index'

  # Embedded article GET route
  get ':title', to: 'articles#open_article', as: 'article'
end
