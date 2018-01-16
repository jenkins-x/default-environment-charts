CHART_REPO := http://jenkins-x-chartmuseum:8080
DIR := "env"
NAMESPACE := "default-staging"
NAME := "env-$(NAMESPACE)"
OS := $(shell uname)

build: clean
	rm -rf requirements.lock
	helm version
	helm init
	helm repo add releases ${CHART_REPO}
	helm dependency build env
	helm lint ${DIR}

install: 
        echo "Installing release ${NAME} to namespace ${NAMESPACE}
	helm install ${DIR} --name ${NAME} --namespace ${NAMESPACE}

upgrade: 
        echo "Upgrading release ${NAME} to namespace ${NAMESPACE}
	helm upgrade ${NAME} ${DIR}  --namespace ${NAMESPACE}

delete:
	helm delete --purge ${NAME}  --namespace ${NAMESPACE}

clean:


