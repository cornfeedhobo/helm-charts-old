.PHONY: debug

debug:
	helm template $(shell basename $${PWD}) . \
		-f debug-values.yaml \
		--debug \
		> debug-render.yaml
