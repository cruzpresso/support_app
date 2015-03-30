Rails.application.routes.draw do

  root "support#index"

  get "/support/new" => "support#new"
  post "/support/new" => "support#create", as: :supports

  get "/support/:id" => "support#edit", as: :support
  patch "/support/:id" => "support#update"
  delete "/support/:id" => "support#destroy"

  get "/support/edit/:id" => "support#edit", as: :edit_post

end
