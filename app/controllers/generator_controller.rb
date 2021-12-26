class GeneratorController < ApplicationController
  before_action :authorise_user, only: %i[generate_by_mold]

  def index
    @styles_names = {names: Dir.entries("#{Rails.root}/app/assets/images/").select { |file| file.split('.')[1] == 'jpg'},
                     images: []}
    render json: @styles_names
  end
end
