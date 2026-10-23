namespace = stephdewit
image = streamlink-server

.PHONY: build push check-version

build: check-version
	docker build . \
		-t $(namespace)/$(image):$(VERSION) \
		-t $(namespace)/$(image):latest

push: check-version
	docker push $(namespace)/$(image):$(VERSION)
	docker push $(namespace)/$(image):latest

check-version:
ifndef VERSION
	$(error VERSION is undefined)
endif
