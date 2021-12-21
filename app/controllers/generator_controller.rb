class GeneratorController < ApplicationController
  before_action :authorise_user, only: %i[generate_by_mold]
  def index

  end
end
