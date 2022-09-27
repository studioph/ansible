#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

LOCAL_BIN="$HOME/.local/bin"
export PATH="$LOCAL_BIN:$PATH"

mkdir -p "$LOCAL_BIN"

sudo apt update
sudo apt install -y \
    python3-pip \
    python3-venv

pip3 install --user pipx
pipx install --include-deps ansible

ansible-galaxy install --role-file requirements.yml
ansible-playbook --ask-become-pass --verbose playbook.yml