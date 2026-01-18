#!/bin/bash

source login.env
sudo docker build --build-arg GITHUB_USER=$GITHUB_USER --build-arg GITHUB_TOKEN=$GITHUB_TOKEN -t debian:3146 .
