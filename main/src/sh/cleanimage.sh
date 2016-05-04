#!/bin/bash


echo "Cleaning image..."

apt-get -y --purge autoremove
apt-get -y clean

rm -rf \
  /tmp/* \
  /var/cache/* \
  /var/lib/apt/lists/* \
  /var/log/* \
  /var/tmp/* \

echo "Image cleaned."
