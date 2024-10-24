#!/bin/bash --login
echo "pulling and Checkout Core tag"
echo "--------------------------------------------"
GIT_SSH_COMMAND="ssh -o KexAlgorithms=ecdh-sha2-nistp521" git fetch --tags jenkins@10.44.0.51:/var/lib/jenkins/workspace/2024-Q3-EMR-pipeline-newIMG-1/HIS-Core-release -f
git checkout v2024.Q3.R6 -f
#git describe > HEAD
echo "____________________________________________"
