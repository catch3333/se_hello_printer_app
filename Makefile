.PHONY: test

docker_build:
	docker build -t hello-world-printer .

docker_run:
	docker run \
		--name hello-world-printer-dev \
		 -p 5000:5000 \
		 -d hello-world-printer

USERNAME = catch3333
TAG = $(USERNAME)/hello-world-printer

docker_push: docker_build
			@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
			docker tag hello-world-printer $(TAG); \
			docker push $(TAG); \
			docker logout;

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

run:
	python main.py

test:
	PYTHONPATH=. py.test

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --cov-report xml --cov-report term \
	--junit-xml=test_results.xml
