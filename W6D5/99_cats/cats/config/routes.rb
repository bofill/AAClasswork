Rails.application.routes.draw do
  resources :cats, only:[:index, :show, :new, :edit, :update, :delete , :create] 

end
