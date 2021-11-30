Rails.application.routes.draw do

  root 'home#index'
  #Возвращает краткое описание проекта
  get '/info', to: 'home#info'

  #Возвращает список всех возможных моделей для генерации
  get '/models', to: 'models#list'

  #Генерирует текстуры по одному из заданных образцов
  get '/textures_generator', to: 'generator#generate'

  #Генерирует текстуры по фото загуженных пользователем
  post '/textures_generator', to: 'generator#generate_by_mold'

  #Вовыодит список загруженных примеров текстур
  get '/textures_generator/textures', to: 'generator#textures_list'

  #Стилизирует загруженную картинку
  post '/image_stylist', to: 'stylist#stylize'

end
