Rails.application.routes.draw do

  #Возвращает краткое описание проекта
  root 'home#info'

  #Часть регистрации пользователей возможно будет удалена
  #Страничка входа
  get '/users/login', to: 'users#login_new'
  get '/users/register', to: 'users#reg_new'

  post '/users/login', to: 'users#login_create'

  post '/users/register', to: 'users#register_create'

  delete '/users/:id', to: 'users#logout'

  #Возращает полную информацию о пльзователе и его моделях
  get '/users/:id/info', to: 'users#info'


  #Страница с моделями
  # #Возвращает список всех возможных моделей для генерации
  get '/models', to: 'models#index'


  #Генерирует текстуры по одному из заданных образцов
  post '/texture', to: 'generator#generate'

  #Генерирует текстуры по фото загуженных пользователем
  post '/texture/by_mold', to: 'generator#generate_by_mold'

  #Вовыодит список загруженных примеров текстур
  get '/texture', to: 'generator#index'


  #Страница с стилями
  get '/image_stylist', to: 'stylist#index'

  #Загружает картинку стиля
  # Обучает под неё модель
  post '/image_stylist/upload', to: 'stylist#download_style'

  #Стилизует загруженную картинку
  post '/image_stylist/stylize', to: 'stylist#stylize'
end
