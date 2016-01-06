Ddzhusu::Application.routes.draw do
  root "video#category"
  #video
  get '/video/:id/', to: 'video#show'
  get '/tag/:tag_name/', to: 'video#tag'
  get ':category_name.html', to: 'video#category'
end
