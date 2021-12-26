import torch
import torchvision.models as models


def load_model():
    device=torch.device("cuda" if torch.cuda.is_available() else "cpu")  
    vgg16 = models.vgg16(pretrained=True)
    vgg = vgg16.features  
    for param in vgg.parameters():  
        param.requires_grad_(False) 
    vgg.to(device)
    return vgg