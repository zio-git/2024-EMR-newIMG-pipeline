#!/bin/bash --login
set -x # Enable debugging
echo "pulling and Checkout API tag-------------------------------------------"
git fetch --tags jenkins@10.44.0.51:/var/lib/jenkins/workspace/2024-Q3-EMR-pipeline-newIMG-1/BHT-EMR-API -f
git checkout v5.3.0-beta -f
git describe > HEAD
echo "____________________________________________"
export PATH=$PATH:/home/emr-user/.rbenv/bin
export PATH=$PATH:/home/emr-user/.rbenv/shims
echo "ruby setup"
source ~/.bashrc
rbenv local 3.2.0
echo "____________________________________________"
echo "Installing Local Gems"
echo "____________________________________________"
bundle install --local
echo "--------------------------------------------"
rm -rf /var/www/BHT-EMR-API/db/migrate/20190527130805_create_uuid_remaps.rb
echo "running bin_update art"
echo "____________________________________________"
./bin/update_art_metadata.sh production
echo "____________________________________________"
echo 'Us3r@E_r' | sudo -S systemctl restart emr-api
echo 'Us3r@E_r' | sudo -S systemctl restart nginx
