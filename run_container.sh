#!/bin/bash
docker rm --force vscode
docker run --restart unless-stopped --name vscode -d -v /home/pi/Coding/Python/read-irca/:/code/ vscode-image
