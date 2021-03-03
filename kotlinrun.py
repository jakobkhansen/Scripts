#! /usr/bin/python
import sys
import subprocess
import os

# filename=$1
# package=$(head -n 1 $filename)
# echo $package
#runname="$(echo $filename | rev | cut -c4- | rev)Kt"
#kotlinc -d /tmp/ $filename
#kotlin /tmp $runname


def main():
    try:
        filename = sys.argv[1]
    except Exception:
        return

    package = find_package(filename)

    runArgument = package + "." + filename.split(".")[0] + "Kt"

    mkDirCommand = "mkdir /tmp/kotlincompiled"
    compileCommand = "kotlinc -d /tmp/kotlincompiled {}".format(filename)
    
    subprocess.call(mkDirCommand.split(), stdout=open(os.devnull), stderr=open(os.devnull))
    subprocess.call(compileCommand.split(), stdout=open(os.devnull))

    runCommand = "java -cp /tmp/kotlincompiled {}".format(runArgument)
    process = subprocess.call(runCommand.split())




# Requires the first non empty line of a file to be the package
def find_package(filename):
    with open(filename) as f:
        lines = [line.rstrip() for line in f]
        non_empty = [line for line in lines if line]
        package_line = non_empty[0].split()

        return package_line[1] if package_line[0] == "package" else ""



if __name__ == "__main__":
    main()
