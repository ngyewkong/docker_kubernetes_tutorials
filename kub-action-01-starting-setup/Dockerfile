# setup k8s on local https://devopscube.com/minikube-mac/
# Step 1: Install Qemu
# Install the Qemu emulator using the following command.
# brew install qemu

# Step 2: Setup Qemu socket_vvmnet
# For minikube service URLs to work, you need to start the socket_vmnet service
# brew install socket_vmnet
# brew tap homebrew/services
# HOMEBREW=$(which brew) && sudo ${HOMEBREW} services start socket_vmnet

# Step 3: Install minikube
# brew install minikube

# Step 4: Start Minikube with the Qemu driver and socket_vmnet
# minikube start --driver qemu --network socket_vmnet
# minikube dashboard -> gets the admin dashboard view of the k8s env
# minikube status -> check if minikube is up and running -> if not run minikube start --driver qemu again
# sample output
# minikube
# type: Control Plane
# host: Running
# kubelet: Running
# apiserver: Running
# kubeconfig: Configured

# even though using k8s -> underlying still need to use docker to build images
# docker build -t k8s-first-app .

# create k8s deployment (imperative)
# kubectl create deployment first-app --image=k8s-first-app -> this will fail as the image is in local and not in the virtual env hosting minikube
# kubectl get deployments
# NAME        READY   UP-TO-DATE   AVAILABLE   AGE
# first-app   0/1     1            0           9s
# kubectl get pods
# NAME                         READY   STATUS             RESTARTS   AGE
# first-app-5748ddf94f-f9zbz   0/1     ImagePullBackOff   0          28s

# solution: push to a public repo like docker hub
# retag: docker tag k8s-first-app ngyewkong/k8s-first-app
# push to docker hub: docker push ngyewkong/k8s-first-app  
# kubectl delete deployment first-app -> remove deployment
# kubectl create deployment first-app --image=ngyewkong/k8s-first-app -> create new deployment

FROM node:14-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 8080

CMD [ "node", "app.js" ]