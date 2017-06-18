latest:
	docker build -t firefox-nightly --build-arg BUILD_DATE=`date +%s` .

scratch:
	docker build -t firefox-nightly --no-cache .
