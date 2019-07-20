#!/bin/bash

gcloud compute instances create puma-app --boot-disk-size=10GB --image-family reddit-full --machine-type=g1-small --tags puma-app


