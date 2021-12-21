class ModelsController < ApplicationController
  MODELS = [:vgg,:resnet]
  def index
    @models = [:vgg,:resnet]
  end
end
