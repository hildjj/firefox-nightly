BUILD_DATE:=$(shell date +%s)
LAST_DATE:=$(shell [ -f .build_date ] && cat .build_date)
TAG="hildjj/firefox-nightly"

latest: .build_date
	docker build -t ${TAG} --build-arg BUILD_DATE=${BUILD_DATE} .

scratch: .build_date
	docker build -t ${TAG} --no-cache .

last:
	docker build -t ${TAG} --build-arg BUILD_DATE=${LAST_DATE} .

push:
	docker tag ${TAG} ${TAG}:${LAST_DATE}
	docker tag ${TAG} ${TAG}:latest
	docker push ${TAG}

.build_date:
	echo ${BUILD_DATE} > .build_date
