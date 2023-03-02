#!/bin/bash
# Script untuk membuat (build) dan mengunggah (push)
# docker image ke GitHub Packages

# Membuat (build) docker image berdasarkan Dockerfile
# di direktori saat ini
docker build -t item-app:v1 .

# Melihat daftar image
docker image ls

# Mengubah nama image untuk di-push ke GitHub Packages
docker tag item-app:v1 ghcr.io/wantotri/a433-microservices/item-app:v1

# Login ke GitHub Packages
echo $GITHUB_ACCESS_TOKEN | docker login ghcr.io -u wantotri --password-stdin

# Mengunggah (push) ke GitHub Packages
docker push ghcr.io/wantotri/a433-microservices/item-app:v1