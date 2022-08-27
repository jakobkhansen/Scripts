i3-msg workspace $(($(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d "\"" -f2) - 1))
