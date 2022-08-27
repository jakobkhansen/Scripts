#! /usr/bin/python

import subprocess
import sys
import argparse
import os


def main():
    parser = argparse.ArgumentParser(description="Open files or change directories")
    parser.add_argument("--directory", "-d", default=".")

    args = parser.parse_args()

    directory = args.directory

    searchResult = performSearch(directory)

    with open(os.devnull, 'w') as f:
        try:
            command = createCommand(searchResult)


            if command[0:2] == 'cd':
                print(command)

            else:
                subprocess.Popen(command.split(), stdout=f, stderr=f)
        except:
            print()

    
def performSearch(directory):
    fdCommand = "fd {}"

    fdCommand = fdCommand.format(directory if directory != "" else ".")

    fdProcess = subprocess.run(fdCommand.split(), stdout=subprocess.PIPE)
    fzfProcess = subprocess.run(["fzf"], stdout=subprocess.PIPE, input=fdProcess.stdout)




    return str(fzfProcess.stdout.decode("UTF-8")).strip()


def createCommand(searchResult):
    if os.path.isdir(searchResult):
        return 'cd {}'.format(searchResult)
    elif os.path.isfile(searchResult):
        return "nohup xdg-open {}".format(searchResult)
    else:
        return ""



if __name__ == "__main__":
    main()
