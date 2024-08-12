.PHONY: zoket


zoket_base:
	@echo "Building zoket_base"
	cd build/zoket && docker build -t ghcr.io/concave-ai/zoket_base -f base.Dockerfile .

zoket_index:
	@echo "Building zoket_index"
	cd build/zoket && docker build -t ghcr.io/concave-ai/zoket_index -f index.Dockerfile .

zoket-web:
	@echo "Building zoket-web"
	cd build/zoket && docker build -t ghcr.io/concave-ai/zoket-web -f web.Dockerfile .

index: zoket_base zoket-web
	@echo "Building index"
	cd build/index && docker build -t ghcr.io/concave-ai/index -f Dockerfile .