# ci_cd/jenkins/scripts/deploy.sh
#!/bin/bash

set -e

echo "Deploying application..."

# Assuming kubectl is configured
kubectl apply -k kubernetes/overlays/prod

echo "Application deployed successfully"