import argparse
parser = argparse.ArgumentParser(description="General bla bla", prog="App", usage="put info here")
parser.add_argument('-p', '--p', type=str, required=True, help="Print stuff")
parser.add_argument('-l', '--l', type=str, required=True, help="List stuff")
parser.add_argument('-o', '--o', type=str, required=True, help="lolers")
args=parser.parse_args()
