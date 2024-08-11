# 🚀 Ecolaura Deployment Guide: Launching Sustainability into the Cloud



## 🌱 Introduction: Planting the Seeds of Green Technology



Welcome, eco-warrior! You're about to embark on an exciting journey to deploy Ecolaura, our platform for sustainable living. This guide will walk you through the process of taking our carefully cultivated code and growing it into a fully-fledged, cloud-based ecosystem. Let's get our hands dirty and start planting!



## 🧰 Prerequisite Tool Belt



Before we begin our eco-friendly construction, make sure you have the following tools in your belt:



- 🐳 Docker: Our sustainable packaging solution

- ☸️ kubectl: The magic wand for orchestrating our Kubernetes cluster

- 🔑 Access to the Ecolaura Kubernetes cluster: Your key to the eco-kingdom

- 🐙 GitHub account: Your passport to our code sanctuary



## 🌿 Deployment Steps: Nurturing Our Digital Garden



### 1. 🏗️ Building and Pushing Docker Images: Crafting Our Eco-Containers



Think of this step as creating biodegradable pots for our digital plants.



```bash

# Cultivate the frontend image

docker build -t ecolaura-frontend:latest -f docker/frontend.Dockerfile .

docker tag ecolaura-frontend:latest your-registry/ecolaura-frontend:latest

docker push your-registry/ecolaura-frontend:latest



# Grow the backend image

docker build -t ecolaura-backend:latest -f docker/backend.Dockerfile .

docker tag ecolaura-backend:latest your-registry/ecolaura-backend:latest

docker push your-registry/ecolaura-backend:latest

```



### 2. 🌾 Deploying to Kubernetes: Planting in Our Cloud Garden



Now, we'll plant our containerized applications in the fertile soil of our Kubernetes cluster.



```bash

# Prepare the soil (namespace)

kubectl apply -f kubernetes/base/namespace.yaml



# Plant our main crops (deployments)

kubectl apply -f kubernetes/base/backend-deployment.yaml

kubectl apply -f kubernetes/base/frontend-deployment.yaml

kubectl apply -f kubernetes/base/database-statefulset.yaml



# Set up irrigation (services)

kubectl apply -f kubernetes/base/services.yaml



# Install a greenhouse (ingress)

kubectl apply -f kubernetes/base/ingress.yaml

```



### 3. 🌍 Configuring DNS: Putting Our Garden on the Map



Let's make sure people can find our digital eco-paradise:



1. Discover the external IP of our ingress controller:

```bash

  kubectl get ingress -n ecolaura

```

2. Update your DNS records, pointing your domain to this IP address. It's like adding a sign that says "Ecolaura's Sustainable Garden This Way!"



### 4. 🔒 Setting Up SSL: Installing a Security Fence



Let's secure our garden with an SSL certificate:



```bash

./configs/ssl/generate_cert.sh

```



This script is like an eco-friendly, automatic fence installer. It sets up a secure perimeter around our garden.



### 5. 🔍 Verifying Deployment: Checking Our Crops



Time to walk through our garden and make sure everything is growing as it should:



```bash

kubectl get pods -n ecolaura

```



Ensure all pods are in the 'Running' state. They should be standing tall and green!



## 🔄 Rollback Procedure: Turning Back the Seasons



Sometimes, we might need to revert to a previous version of our garden. Here's how:



1. Identify the previous version's image tag (think of it as last season's seed packet).

2. Update the deployment YAML files with the previous image tag.

3. Re-plant with the updated deployments:

```bash

  kubectl apply -f kubernetes/base/backend-deployment.yaml

  kubectl apply -f kubernetes/base/frontend-deployment.yaml

```



## 👀 Monitoring Deployment: Keeping a Watchful Eye on Our Garden



- 📊 Grafana dashboard: Your high-tech garden monitoring system. Access at https://grafana.ecolaura.com

- 📈 Prometheus metrics: The soil sensors of our digital garden. Check at https://prometheus.ecolaura.com

- 📜 Kibana logs: Like a detailed garden journal. View at https://kibana.ecolaura.com



## 🆘 Troubleshooting: Garden First Aid



If you encounter any wilting services or pest problems during deployment, consult the troubleshooting section in our infrastructure documentation. If the problem persists, don't hesitate to call our expert gardeners (DevOps team).



Remember, deploying Ecolaura is not just about launching a application; it's about cultivating a sustainable digital ecosystem. Each step you take brings us closer to a greener, more eco-friendly online world. 



Happy gardening, and may your deployments always be green! 🌱🚀