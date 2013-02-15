Mstwjs::Application.routes.draw do
  get "welcome/new"

  get "welcome/create"

  get "welcome/update"

  get "welcome/show"

  get "welcome/destroy"

  get "welcome/edit"

  get "welcome/index"

  root :to => 'welcome#index'
end
