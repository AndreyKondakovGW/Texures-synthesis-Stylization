class StylistController < ApplicationController
  before_action :authorise_user, only: %i[download_style]
  def index
    @styles = Style.all()
  end

  def download_style
    @style = Style.create(style_params)
    #@image =  Обработка из памяти гемом приходит строка в bs64
    # Как дастать картинку из пост запроса
    # params[:field_name]
    # запуск питон скриптов через active jobs
  end

  def style_params
    params.require(:style)
          .permit(:name, :path)
  end
end
