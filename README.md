# ITSC 3146 - Intro to Operating Systems & Networking
## Docker Environment

This Docker setup provides a containerized environment for ITSC 3146 coursework.

### Features
- Configured for XWayland compatibility
- Host Docker access enabled for Imunes functionality
- Shared folder in the container that can be edited on the host computer

### Prerequisites

**Arch Linux:**
```bash
sudo pacman -S docker docker-buildx xorg-xwayland xorg-xhost
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
xhost +local:docker
```

### Getting Started


**GitHub Personal Access Token:**
1. Go to https://github.com/settings/tokens
2. Generate new token (classic) with "repo" scope
3. Copy the token

**Environment Setup:**
```bash
echo "GITHUB_TOKEN=your_token_here" > login.env
echo "GITHUB_USER=your_github_username" >> login.env
echo "login.env" >> .gitignore
```

**Build the container:**
```bash
./builddocker.sh
```

**Run the container:**
```bash
./rundocker.sh
```
