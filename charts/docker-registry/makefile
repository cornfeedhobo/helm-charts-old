.PHONY: debug

debug:
	@helm template docker-registry . \
		-f debug-values.yaml \
		--api-versions cert-manager.io/v1 \
		--debug \
		> debug-render.yaml
