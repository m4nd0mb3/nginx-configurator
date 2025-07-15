NAME := nginx-config
DEST := /usr/local/bin
VERSION := $(shell git rev-parse --short HEAD)
TAG := v$(VERSION)

install:
	cp $(NAME).sh $(DEST)/$(NAME)
	chmod +x $(DEST)/$(NAME)
	@echo "✅ Instalado em $(DEST)/$(NAME)"

uninstall:
	rm -f $(DEST)/$(NAME)
	@echo "🗑️ Removido de $(DEST)/$(NAME)"

release:
	gh release create $(TAG) \
		--title "Release $(TAG)" \
		--notes "Versão automática baseada no commit $(VERSION)" \
		$(NAME).sh
