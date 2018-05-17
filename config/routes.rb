Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :blog_entries
  end

  scope Spree::Config['blog_alias'], as: 'blog' do
    get '/tag/:tag', to: 'blog_entries#tag', as: :tag
    get '/category/:category', to: 'blog_entries#category', as: :category
    get '/author/:author', to: 'blog_entries#author', as: :author
    get '/:year/:month/:day/:slug', to: 'blog_entries#show', as: :entry_permalink
    get '/:year(/:month)(/:day)', to: 'blog_entries#archive', as: :archive, constraints: {year: /(19|20)\d{2}/, month: /[01]?\d/, day: /[0-3]?\d/}
    get '/feed', to: 'blog_entries#feed', as: :feed, format: :rss
    get '/', to: 'blog_entries#index'
  end
end
