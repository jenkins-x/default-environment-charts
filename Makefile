CHART_REPO := http://jenkins-x-chartmuseum:8080
DIR := "env"
NAMESPACE := "change-me"
OS := $(shell uname)

build: clean
	rm -rf requirements.lock
	helm version
	helm init
	helm repo add releases ${CHART_REPO}
	helm dependency build ${DIR}
	helm lint ${DIR}

install: 
	helm upgrade ${NAMESPACE} ${DIR} --install --namespace ${NAMESPACE}

delete:
	helm delete --purge ${NAMESPACE}  --namespace ${NAMESPACE}

clean:


