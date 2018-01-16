CHART_REPO := http://jenkins-x-chartmuseum:8080
DIR := "env"
NAMESPACE := "default-staging"
OS := $(shell uname)

build: clean
	rm -rf requirements.lock
	helm version
	helm init
	helm repo add releases ${CHART_REPO}
	helm dependency build ${DIR}
	helm lint ${DIR}

install: 
	helm install ${DIR} --name ${NAMESPACE} --namespace ${NAMESPACE}

upgrade: 
	helm upgrade ${NAMESPACE} ${DIR}  --namespace ${NAMESPACE}

delete:
	helm delete --purge ${NAMESPACE}  --namespace ${NAMESPACE}

clean:


