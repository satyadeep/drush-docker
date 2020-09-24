build:
	docker build -t satyadeep/drush:base base
	docker build -t satyadeep/drush:10 10
	docker build -t satyadeep/drush:9 9
	docker build -t satyadeep/drush:8 8
	docker build -t satyadeep/drush:7 7


version:
	docker run satyadeep/drush --version
	docker run satyadeep/drush:10 --version
	docker run satyadeep/drush:9 --version
	docker run satyadeep/drush:8 --version
	docker run satyadeep/drush:7 --version


test:
	@make version
