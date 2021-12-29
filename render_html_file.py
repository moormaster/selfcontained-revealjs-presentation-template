#!/usr/bin/python3

import argparse
from jinja2 import Environment, DictLoader, select_autoescape

def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('templatefile', type=str, help='Jinja2 template file for the revealjs html file')

    return parser.parse_args()

def read_file(path):
    with open(path, mode='r', encoding='utf-8') as f:
        contents = f.read()
        f.close()

    return contents 

def main(args):
    template_contents = read_file(args.templatefile)

    env = Environment(
        loader=DictLoader({'template.html': template_contents})
    )

    template = env.get_template('template.html')
    print(template.render({'read_file': read_file}))    

if __name__ == '__main__':
    args = parse_arguments()
    main(args)
