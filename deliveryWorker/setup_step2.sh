#!/bin/bash

pushd latest/portal
sudo make up
popd

echo ==========SCOPE 
echo if you see that the admin account is fine, then go to the next script ./setup_step3.sh
echo else call the same script again ./setup_step2.sh

