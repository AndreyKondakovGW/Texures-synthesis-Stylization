
import torch
import torchvision.transforms as T
from PIL import Image
import os
import numpy as np
from matplotlib import cm

from model_classes.vgg_64x64_10 import ImageTransformNet, ConvLayer, ResidualBlock, UpsampleConvLayer

MODEL_PATH = os.getcwd() + '/models/'+ 'vgg_model64x64_10epoch'
image_size = 64

def save_image(filename, data):
    img = data.clone().numpy()
    img = ((img).transpose(1, 2, 0)*255.0).clip(0, 255).astype("uint8")
    img = Image.fromarray(img)
    img.save(filename)

def run_stylization(model, img, output_size = 256):
    transform = T.Compose([  
                T.ToTensor(),
                T.Resize((image_size,image_size)),
            ])
    image_tensor=transform(img).unsqueeze(0)
    transformed_img = model(image_tensor)
    resizer = T.Resize((output_size,output_size))
    transformed_img = resizer(transformed_img)

    arr = transformed_img.detach().cpu()
    return arr.reshape(3, output_size, output_size)  


if __name__ == "__main__":
    img_name = "111sample1.jpg"
    model = torch.load(MODEL_PATH, map_location=torch.device('cpu'))
    model.eval()
    directory = os.getcwd()
    image = style_image=Image.open(directory + '/images/'+ img_name).convert('RGB')
    styled_arr = run_stylization(model, image)
    print(styled_arr.shape)
    

    save_image( directory +"/images/styled_img.jpg", styled_arr)