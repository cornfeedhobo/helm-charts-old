.PHONY: helm-docs

CHART_DIRS = $(shell ls -d charts/*)

helm-docs:
	@for d in $(CHART_DIRS); do \
		cd $$d && helm-docs; \
	done
