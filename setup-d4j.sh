#!/usr/bin/env bash
set -euxo pipefail

git clone https://github.com/rjust/defects4j
curl -L https://cpanmin.us | perl - --sudo App::cpanminus
cd defects4j
sudo cpanm --installdeps .
./init.sh

