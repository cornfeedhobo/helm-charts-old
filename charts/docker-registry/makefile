.PHONY: debug

debug:
	@helm template docker-registry . \
		-f debug-values.yaml \
		--debug \
		> debug-render.yaml
