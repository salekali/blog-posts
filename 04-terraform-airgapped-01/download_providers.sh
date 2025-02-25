#!/bin/bash

PROVIDERS=(
  "hashicorp/aws:5.58.0"
  "hashicorp/azuread:2.43.0"
  "hashicorp/azurerm:3.50.0"
  "hashicorp/kubernetes:2.15.0"
)

ARCH="linux_amd64"

mkdir -p /terraform-mirror

for provider in "${PROVIDERS[@]}"; do
  IFS=':' read -r name version <<< "$provider"
  echo "Downloading $name v$version..."
  mkdir -p /terraform-mirror/registry.terraform.io/$name/$version/$ARCH
  wget -q https://releases.hashicorp.com/terraform-provider-${name#*/}/$version/terraform-provider-${name#*/}_${version}_${ARCH}.zip
  unzip terraform-provider-${name#*/}_${version}_${ARCH}.zip -d /terraform-mirror/registry.terraform.io/$name/$version/$ARCH
  rm terraform-provider-${name#*/}_${version}_${ARCH}.zip
done

echo "All providers downloaded for offline use."
