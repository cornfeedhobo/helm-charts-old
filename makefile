.PHONY: all helm-docs helm-lint

CHART_DIRS = $(shell ls -d charts/*)

default: all

helm-docs:
	@for d in $(CHART_DIRS); do \
		cd $$d && helm-docs \
	; done

helm-lint:
	@for d in $(CHART_DIRS); do \
		cd $$d \
		&& echo "$$d" \
		&& helm lint \
	; done

all: helm-docs helm-lint
	@# all
