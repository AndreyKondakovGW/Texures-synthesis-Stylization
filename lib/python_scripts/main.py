import argparse
import string



arg_parser = argparse.ArgumentParser()

arg_parser.add_argument('img_path', type=string)

args = arg_parser.parse_args()