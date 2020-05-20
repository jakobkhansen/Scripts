#!/usr/bin/python

import json
import subprocess


def main():
    output = subprocess.check_output(['i3-msg', '-t', 'get_workspaces'])
    workspaces = json.loads(output)
    workspace_nums = [int(ws["num"]) for ws in workspaces]

    active_workspace = 0
    for ws in workspaces:
        print(ws)
        if ws["focused"]:
            active_workspace = int(ws["num"])
            break

    subprocess.call(["i3-msg", "workspace", str(101)])


    print(active_workspace)

    print(workspace_nums)
    for i in workspace_nums:
        output = subprocess.check_output(['i3-msg', '-t', 'get_workspaces'])
        workspaces = json.loads(output)
        workspace_list = (i for i in range(1, 100) if not [ws for ws in workspaces if ws['num'] == i])

        next_num = next(workspace_list)

        print("i: " + str(i))
        print("next_num: {}".format(next_num))
        if (next_num < i):
            subprocess.call(['i3-msg', 'rename workspace {} to {}'.format(i, next_num)])

    subprocess.call(["i3-msg", "workspace", str(active_workspace)])

if __name__ == "__main__":
    main()
