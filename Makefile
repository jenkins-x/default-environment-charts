CHART_REPO := http://jenkins-x-chartmuseum:8080
NAME := "env"
NAMESPACE := "default-staging"
OS := $(shell uname)

build: clean
	rm -rf requirements.lock
	helm version
	helm init
	helm repo add releases ${CHART_REPO}
	helm dependency build env
	helm lint env

install: clean build
	helm install env --name ${NAME} --namespace ${NAMESPACE}

upgrade: clean build
	helm upgrade ${NAME} .  --namespace ${NAMESPACE}

delete:
	helm delete --purge ${NAME}  --namespace ${NAMESPACE}

clean:


