# This file is part of Prassble's .devcontainer folder.
# Prassble's .devcontainer folder is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# Prassble's .devcontainer folder is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with Prassble's .devcontainer folder. If not, see <https://www.gnu.org/licenses/>.

# Install the latest TeXlive image
FROM texlive/texlive:latest

# Install Git-LFS to ensure Git source control works 
RUN <<EOF
apt-get update && apt-get upgrade
apt-get install sudo
sudo apt-get install git-lfs
EOF

# Extension Bash IDE: prerequisites
RUN <<EOF
apt install shellcheck
apt install -y golang
go install mvdan.cc/sh/v3/cmd/shfmt@latest
EOF